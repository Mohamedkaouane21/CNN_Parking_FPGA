// main.c — ESP32-WROOM (ESP-IDF 5.x)
// LMIC (LoRaWAN OTAA EU868) + UART2 reader + WiFi/MQTT fallback (ROBUSTE)
//
// ✅ UART2 reçoit: {"free":12,"occupied":8}\r\n
// ✅ Parse free/occupied
// ✅ LoRa payload: 4 octets (uint16 BE): [free_hi][free_lo][occ_hi][occ_lo], FPort=1
// ✅ WiFi/MQTT: publie JSON: {"device":"uart2","free":12,"occupied":8,"raw_hex":"..."}
// ✅ Fallback WiFi si JOIN LoRa échoue / ACK manquants / TXRXPEND stuck
//
// ✅ Demandes appliquées :
// 1) Retry LoRa toutes les 60s même sans IP WiFi  ✅ (timer périodique en fallback)
// 2) RX1 delay TTN = 5s ✅ (LMIC.rxDelay = 5 en EU868)
// 3) Fallback propre SANS esp_wifi_deinit() ✅ (stop/disconnect seulement)
//
// ⚠️ IMPORTANT : après CHAQUE LMIC_reset(), on ré-applique ADR + rxDelay + clockError + linkcheck.

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "freertos/semphr.h"

#include "esp_log.h"
#include "esp_err.h"
#include "nvs_flash.h"
#include "esp_netif.h"
#include "esp_event.h"
#include "esp_wifi.h"
#include "mqtt_client.h"
#include "esp_timer.h"

#include "driver/uart.h"

#include "lmic.h"
#include "hal/hal.h"

#define TAG "UART2_APP"

// =====================
// WiFi / MQTT
// =====================
#define WIFI_SSID   "mohamed"
#define WIFI_PASS   "21022001"

#define MQTT_URI    "mqtt://3.225.59.240:1883"
#define MQTT_TOPIC  "DataUpdate"
#define MQTT_USER    "smartuser"
#define MQTT_PASSWD  "5WAA1WvZOHEf1Z9k1kAEYd5IB4inWci2"

// =====================
// UART2
// =====================
#define UART_PORT UART_NUM_2
#define UART_TX   17
#define UART_RX   16
#define UART_BAUD 115200
#define UART_RX_BUF_SIZE 1024

// =====================
// LoRaWAN policy
// =====================
#define LORA_JOIN_TIMEOUT_S      30
#define LORA_JOIN_MAX_ATTEMPTS   2
#define LORA_SEND_PERIOD_S       60

#define LORA_CONFIRMED_UPLINK    1
#define LORA_ACK_MAX_MISSES      3

// ✅ Retry LoRa en fallback même sans IP
#define LORA_RETRY_PERIOD_MS      (60 * 1000)
#define WIFI_STOP_COOLDOWN_MS     1500    // laisse le temps au système de se stabiliser avant RX1

// =====================
// TXRXPEND watchdog
// =====================
static int      g_txpend_skips     = 0;
static uint32_t g_last_tx_kick_ms  = 0;
#define LORA_TXPEND_MAX_SKIPS     5
#define LORA_TXPEND_TIMEOUT_MS    30000

// =====================
// TTN OTAA (EU868)
// ⚠️ Si JOIN ne marche pas, inverse APPEUI/DEVEUI
// =====================
static const u1_t APPEUI[8]  = { 0x50,0x41,0x98,0x1B,0x1D,0x41,0x40,0xA8 };
static const u1_t DEVEUI[8]  = { 0x34,0x5B,0x07,0xD0,0x7E,0xD5,0xB3,0x70 };
static const u1_t APPKEY[16] = { 0x00,0x12,0xF2,0x1B,0xFA,0xF2,0x24,0x62,0x07,0xCA,0x68,0xE3,0xF4,0x62,0x40,0x81 };

void os_getArtEui (u1_t* buf) { memcpy(buf, APPEUI, 8); }
void os_getDevEui (u1_t* buf) { memcpy(buf, DEVEUI, 8); }
void os_getDevKey (u1_t* buf) { memcpy(buf, APPKEY, 16); }

// =====================
// Modes
// =====================
typedef enum {
    MODE_LORA_TRYJOIN = 0,
    MODE_LORA_JOINED  = 1,
    MODE_WIFI_FALLBACK= 2,
} app_mode_t;

static volatile app_mode_t g_mode = MODE_LORA_TRYJOIN;
static int g_join_attempts = 0;
static int g_ack_misses    = 0;

// LMIC jobs
static osjob_t sendjob;
static osjob_t join_timeout_job;

// =====================
// Shared UART state
// =====================
static SemaphoreHandle_t g_uart_mutex = NULL;

static uint8_t  g_uart_last[UART_RX_BUF_SIZE];
static int      g_uart_last_len = 0;

static bool     g_uart_decoded_ok = false;
static uint16_t g_uart_free = 0;
static uint16_t g_uart_occupied = 0;

// LoRa payload (4 bytes)
static uint8_t lora_payload[4];

// =====================
// WiFi/MQTT state
// =====================
static EventGroupHandle_t wifi_event_group = NULL;
#define WIFI_GOTIP_BIT BIT0

static esp_mqtt_client_handle_t g_mqtt = NULL;
static volatile bool g_mqtt_ready   = false;
static volatile bool g_mqtt_started = false;

static volatile bool g_wifi_inited  = false;
static volatile bool g_wifi_started = false;
static volatile bool g_netif_inited = false;
static volatile bool g_eventloop_inited = false;

// ✅ Retry LoRa flag (set by timer, executed in main loop)
static volatile bool g_request_lora_retry = false;
static esp_timer_handle_t g_lora_retry_timer = NULL;

// =====================
// Forward declarations (avoid “undeclared” build error)
// =====================
static void join_timeout_cb(osjob_t* j);
static void do_send(osjob_t* j);
static void switch_to_wifi(void);
static void wifi_mqtt_stop(void);

static void wifi_event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data);
static void mqtt_event_handler(void *handler_args, esp_event_base_t base, int32_t event_id, void *event_data);

// =====================
// Helpers
// =====================
static const char* wifi_disc_reason_str(uint8_t r)
{
    switch (r) {
        case WIFI_REASON_NO_AP_FOUND: return "NO_AP_FOUND";
        case WIFI_REASON_AUTH_FAIL: return "AUTH_FAIL";
        case WIFI_REASON_4WAY_HANDSHAKE_TIMEOUT: return "4WAY_HANDSHAKE_TIMEOUT";
        default: return "OTHER";
    }
}

static int bytes_to_hex(const uint8_t *in, int in_len, char *out, int out_sz)
{
    static const char *HEX = "0123456789ABCDEF";
    int needed = in_len * 2 + 1;
    if (out_sz < needed) return -1;

    for (int i = 0; i < in_len; i++) {
        out[i*2 + 0] = HEX[(in[i] >> 4) & 0x0F];
        out[i*2 + 1] = HEX[in[i] & 0x0F];
    }
    out[in_len*2] = '\0';
    return in_len * 2;
}

static void rstrip(char *s)
{
    int n = (int)strlen(s);
    while (n > 0) {
        char c = s[n - 1];
        if (c == '\r' || c == '\n' || c == ' ' || c == '\t') {
            s[n - 1] = '\0';
            n--;
        } else break;
    }
}

static bool decode_uart_json_free_occ(const uint8_t *buf, int len, uint16_t *out_free, uint16_t *out_occ)
{
    if (!buf || len <= 0 || !out_free || !out_occ) return false;

    char s[256];
    int slen = (len < (int)sizeof(s) - 1) ? len : (int)sizeof(s) - 1;
    memcpy(s, buf, slen);
    s[slen] = '\0';
    rstrip(s);

    const char *p_free = strstr(s, "\"free\"");
    const char *p_occ  = strstr(s, "\"occupied\"");
    if (!p_free || !p_occ) return false;

    int f = -1, o = -1;

    const char *c1 = strchr(p_free, ':');
    const char *c2 = strchr(p_occ, ':');
    if (!c1 || !c2) return false;

    c1++; while (*c1 == ' ' || *c1 == '\t') c1++;
    c2++; while (*c2 == ' ' || *c2 == '\t') c2++;

    if (sscanf(c1, "%d", &f) != 1) return false;
    if (sscanf(c2, "%d", &o) != 1) return false;

    if (f < 0 || f > 65535 || o < 0 || o > 65535) return false;

    *out_free = (uint16_t)f;
    *out_occ  = (uint16_t)o;
    return true;
}

static void build_lora_payload_u16(uint16_t free_v, uint16_t occ_v)
{
    lora_payload[0] = (uint8_t)((free_v >> 8) & 0xFF);
    lora_payload[1] = (uint8_t)(free_v & 0xFF);
    lora_payload[2] = (uint8_t)((occ_v >> 8) & 0xFF);
    lora_payload[3] = (uint8_t)(occ_v & 0xFF);
}

// =====================
// ADR + TTN RX1 delay = 5s (apply after every reset)
// =====================
static void lmic_apply_params(void)
{
    // RC oscillator tolerance (WiFi/tasks => jitter)
    LMIC_setClockError(MAX_CLOCK_ERROR * 10 / 100); // 10%

    // ADR auto-SF/DR
    LMIC_setAdrMode(1);

    // TTN recommended
    LMIC_setLinkCheckMode(0);

#ifdef CFG_eu868
    // ✅ TTN RX1 delay = 5 seconds
    LMIC.rxDelay = 5;
#endif
}

// =====================
// UART init + reader task
// =====================
static void uart2_init(void)
{
    const uart_config_t cfg = {
        .baud_rate = UART_BAUD,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .source_clk = UART_SCLK_DEFAULT
    };

    ESP_ERROR_CHECK(uart_driver_install(UART_PORT, UART_RX_BUF_SIZE * 2, 0, 0, NULL, 0));
    ESP_ERROR_CHECK(uart_param_config(UART_PORT, &cfg));
    ESP_ERROR_CHECK(uart_set_pin(UART_PORT, UART_TX, UART_RX,
                                 UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE));

    ESP_LOGI(TAG, "UART2 ready (RX=%d TX=%d baud=%d)", UART_RX, UART_TX, UART_BAUD);
}

static void uart_reader_task(void *arg)
{
    (void)arg;
    uint8_t data[UART_RX_BUF_SIZE];

    while (1) {
        int len = uart_read_bytes(UART_PORT, data, UART_RX_BUF_SIZE, pdMS_TO_TICKS(1000));
        if (len > 0) {
            uint16_t f = 0, o = 0;
            bool ok = decode_uart_json_free_occ(data, len, &f, &o);

            xSemaphoreTake(g_uart_mutex, portMAX_DELAY);

            int copy_len = (len > UART_RX_BUF_SIZE) ? UART_RX_BUF_SIZE : len;
            memcpy(g_uart_last, data, copy_len);
            g_uart_last_len = copy_len;

            if (ok) {
                g_uart_decoded_ok = true;
                g_uart_free = f;
                g_uart_occupied = o;
                ESP_LOGI(TAG, "DECODE OK => free=%u occupied=%u", (unsigned)f, (unsigned)o);
            } else {
                g_uart_decoded_ok = false;
                ESP_LOGW(TAG, "DECODE FAIL (len=%d) -> will send raw hex only", len);
            }

            xSemaphoreGive(g_uart_mutex);
        }
    }
}

// =====================
// WiFi / MQTT handlers
// =====================
static void wifi_try_reconnect(void)
{
    esp_err_t err = esp_wifi_connect();
    if (err != ESP_OK) {
        ESP_LOGW(TAG, "esp_wifi_connect()=%s", esp_err_to_name(err));
    }
}

static void wifi_event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data)
{
    (void)arg;

    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        ESP_LOGI(TAG, "WIFI_STA_START -> connect()");
        wifi_try_reconnect();
        return;
    }

    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        wifi_event_sta_disconnected_t *e = (wifi_event_sta_disconnected_t*)event_data;
        ESP_LOGW(TAG, "STA_DISCONNECTED reason=%d (%s)", e->reason, wifi_disc_reason_str(e->reason));

        g_mqtt_ready = false;
        if (wifi_event_group) xEventGroupClearBits(wifi_event_group, WIFI_GOTIP_BIT);

        // retry (no vTaskDelay here)
        wifi_try_reconnect();
        return;
    }

    if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t *e = (ip_event_got_ip_t*)event_data;
        ESP_LOGI(TAG, "GOT_IP: " IPSTR, IP2STR(&e->ip_info.ip));
        if (wifi_event_group) xEventGroupSetBits(wifi_event_group, WIFI_GOTIP_BIT);
        return;
    }
}

static void mqtt_event_handler(void *handler_args, esp_event_base_t base, int32_t event_id, void *event_data)
{
    (void)handler_args; (void)base;
    esp_mqtt_event_handle_t event = (esp_mqtt_event_handle_t)event_data;
    (void)event;

    switch ((esp_mqtt_event_id_t)event_id) {
        case MQTT_EVENT_CONNECTED:
            g_mqtt_ready = true;
            ESP_LOGI(TAG, "MQTT connected");
            break;
        case MQTT_EVENT_DISCONNECTED:
            g_mqtt_ready = false;
            ESP_LOGW(TAG, "MQTT disconnected");
            break;
        case MQTT_EVENT_ERROR:
            g_mqtt_ready = false;
            ESP_LOGE(TAG, "MQTT error");
            break;
        default:
            break;
    }
}

// =====================
// WiFi init/start (non-bloquant) + MQTT start only if IP
// =====================
static void wifi_init_once(void)
{
    if (g_wifi_inited) return;

    esp_err_t err;

    if (!g_netif_inited) {
        err = esp_netif_init();
        if (err != ESP_OK && err != ESP_ERR_INVALID_STATE) ESP_ERROR_CHECK(err);
        g_netif_inited = true;
    }

    if (!g_eventloop_inited) {
        err = esp_event_loop_create_default();
        if (err != ESP_OK && err != ESP_ERR_INVALID_STATE) ESP_ERROR_CHECK(err);
        g_eventloop_inited = true;
    }

    if (!wifi_event_group) wifi_event_group = xEventGroupCreate();

    esp_netif_create_default_wifi_sta();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler, NULL));

    wifi_config_t w = {0};
    snprintf((char*)w.sta.ssid, sizeof(w.sta.ssid), "%s", WIFI_SSID);
    snprintf((char*)w.sta.password, sizeof(w.sta.password), "%s", WIFI_PASS);

    w.sta.threshold.authmode = (strlen(WIFI_PASS) == 0) ? WIFI_AUTH_OPEN : WIFI_AUTH_WPA2_PSK;
    w.sta.pmf_cfg.capable = false;
    w.sta.pmf_cfg.required = false;

    // Robust scan/connect
    w.sta.scan_method = WIFI_ALL_CHANNEL_SCAN;
    w.sta.sort_method = WIFI_CONNECT_AP_BY_SIGNAL;
    w.sta.failure_retry_cnt = 1; // we handle reconnects ourselves

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &w));
    ESP_ERROR_CHECK(esp_wifi_set_ps(WIFI_PS_NONE));

    g_wifi_inited = true;
}

static void wifi_start_if_needed(void)
{
    if (g_wifi_started) return;

    wifi_init_once();

    xEventGroupClearBits(wifi_event_group, WIFI_GOTIP_BIT);

    ESP_LOGW(TAG, "=== START WIFI (FALLBACK) ===");
    ESP_ERROR_CHECK(esp_wifi_start());
    g_wifi_started = true;
}

static void mqtt_start_if_needed(void)
{
    if (g_mqtt_started) return;

    esp_mqtt_client_config_t mqtt_cfg = {
        .broker.address.uri = MQTT_URI,
        .session.keepalive = 60,
        .credentials.username = MQTT_USER,
        .credentials.authentication.password = MQTT_PASSWD,
    };

    g_mqtt = esp_mqtt_client_init(&mqtt_cfg);
    ESP_ERROR_CHECK(esp_mqtt_client_register_event(g_mqtt, ESP_EVENT_ANY_ID, mqtt_event_handler, NULL));
    ESP_ERROR_CHECK(esp_mqtt_client_start(g_mqtt));
    g_mqtt_started = true;
}

// ✅ Stop propre: pas de esp_wifi_deinit()
static void wifi_mqtt_stop(void)
{
    if (g_mqtt) {
        ESP_LOGW(TAG, "Stopping MQTT...");
        esp_mqtt_client_stop(g_mqtt);
        esp_mqtt_client_destroy(g_mqtt);
        g_mqtt = NULL;
    }
    g_mqtt_ready = false;
    g_mqtt_started = false;

    if (g_wifi_started) {
        ESP_LOGW(TAG, "Stopping WiFi...");
        esp_wifi_disconnect();
        esp_wifi_stop();
    }
    g_wifi_started = false;

    if (wifi_event_group) xEventGroupClearBits(wifi_event_group, WIFI_GOTIP_BIT);
}

// =====================
// WiFi manager task (fallback)
// =====================
static void wifi_manager_task(void *arg)
{
    (void)arg;

    while (1) {
        if (g_mode == MODE_WIFI_FALLBACK) {
            wifi_start_if_needed();

            // MQTT only if got IP
            if (wifi_event_group) {
                EventBits_t b = xEventGroupGetBits(wifi_event_group);
                if (b & WIFI_GOTIP_BIT) {
                    mqtt_start_if_needed();
                }
            }
        }
        vTaskDelay(pdMS_TO_TICKS(250));
    }
}

static void wifi_publish_task(void *arg)
{
    (void)arg;
    static char hexbuf[UART_RX_BUF_SIZE * 2 + 1];

    while (1) {
        if (g_mode != MODE_WIFI_FALLBACK) {
            vTaskDelay(pdMS_TO_TICKS(500));
            continue;
        }

        if (g_mqtt && g_mqtt_ready) {
            uint8_t tmp[UART_RX_BUF_SIZE];
            int len = 0;
            bool ok = false;
            uint16_t f = 0, o = 0;

            xSemaphoreTake(g_uart_mutex, portMAX_DELAY);
            len = g_uart_last_len;
            if (len > 0) memcpy(tmp, g_uart_last, len);
            ok = g_uart_decoded_ok;
            f = g_uart_free;
            o = g_uart_occupied;
            xSemaphoreGive(g_uart_mutex);

            if (len > 0) {
                int hex_chars = bytes_to_hex(tmp, len, hexbuf, sizeof(hexbuf));
                if (hex_chars < 0) { hexbuf[0] = '\0'; hex_chars = 0; }

                int print_hex = hex_chars;
                if (print_hex > 120) print_hex = 120;

                char msg[256];
                if (ok) {
                    snprintf(msg, sizeof(msg),
                             "{\"device\":\"uart2\",\"free\":%u,\"occupied\":%u,\"raw_hex\":\"%.*s\"}",
                             (unsigned)f, (unsigned)o, print_hex, hexbuf);
                } else {
                    snprintf(msg, sizeof(msg),
                             "{\"device\":\"uart2\",\"len\":%d,\"raw_hex\":\"%.*s\"}",
                             len, print_hex, hexbuf);
                }

                int id = esp_mqtt_client_publish(g_mqtt, MQTT_TOPIC, msg, 0, 0, 0);
                ESP_LOGI(TAG, "MQTT publish id=%d => %s", id, msg);
            } else {
                ESP_LOGW(TAG, "No UART data yet -> skip MQTT");
            }
        } else {
            int got_ip = (wifi_event_group && (xEventGroupGetBits(wifi_event_group) & WIFI_GOTIP_BIT)) ? 1 : 0;
            ESP_LOGW(TAG, "MQTT not ready (mqtt=%p ready=%d got_ip=%d)",
                     (void*)g_mqtt, (int)g_mqtt_ready, got_ip);
        }

        vTaskDelay(pdMS_TO_TICKS(5000));
    }
}

// =====================
// Periodic LoRa retry timer (fallback) — even without IP
// =====================
static void lora_retry_timer_cb(void *arg)
{
    (void)arg;
    if (g_mode == MODE_WIFI_FALLBACK) {
        ESP_LOGW(TAG, "⏱️ LoRa retry tick (60s) -> request retry");
        g_request_lora_retry = true;
    }
}

static void lora_retry_timer_start(void)
{
    if (!g_lora_retry_timer) return;
    esp_timer_stop(g_lora_retry_timer);
    ESP_ERROR_CHECK(esp_timer_start_periodic(g_lora_retry_timer, (uint64_t)LORA_RETRY_PERIOD_MS * 1000ULL));
}

static void lora_retry_timer_stop(void)
{
    if (!g_lora_retry_timer) return;
    esp_timer_stop(g_lora_retry_timer);
}

// =====================
// Mode switch
// =====================
static void switch_to_wifi(void)
{
    if (g_mode == MODE_WIFI_FALLBACK) return;

    ESP_LOGW(TAG, "Switching to WIFI fallback mode");

    os_clearCallback(&sendjob);
    os_clearCallback(&join_timeout_job);

    g_mode = MODE_WIFI_FALLBACK;

    g_txpend_skips = 0;
    g_last_tx_kick_ms = 0;

    // ✅ start periodic LoRa retry even without IP
    lora_retry_timer_start();
}

// =====================
// LMIC send job (LoRa)
// =====================
static void do_send(osjob_t* j)
{
    (void)j;
    if (g_mode != MODE_LORA_JOINED) return;

    uint32_t now_ms = (uint32_t)esp_log_timestamp();

    if (LMIC.opmode & OP_TXRXPEND) {
        g_txpend_skips++;
        printf("⏳ TXRXPEND, skip (%d/%d)\n", g_txpend_skips, LORA_TXPEND_MAX_SKIPS);

        if (g_last_tx_kick_ms != 0 && (now_ms - g_last_tx_kick_ms) > LORA_TXPEND_TIMEOUT_MS) {
            printf("❌ TXRXPEND stuck > %d ms -> WIFI fallback\n", LORA_TXPEND_TIMEOUT_MS);
            switch_to_wifi();
            return;
        }
        if (g_txpend_skips >= LORA_TXPEND_MAX_SKIPS) {
            printf("❌ Too many TXRXPEND skips -> WIFI fallback\n");
            switch_to_wifi();
            return;
        }

        os_setTimedCallback(&sendjob, os_getTime() + sec2osticks(LORA_SEND_PERIOD_S), do_send);
        return;
    }

    bool ok = false;
    uint16_t f = 0, o = 0;

    xSemaphoreTake(g_uart_mutex, portMAX_DELAY);
    ok = g_uart_decoded_ok;
    f  = g_uart_free;
    o  = g_uart_occupied;
    xSemaphoreGive(g_uart_mutex);

    if (!ok) {
        printf("📡 No decoded UART yet -> skip LoRa\n");
        os_setTimedCallback(&sendjob, os_getTime() + sec2osticks(LORA_SEND_PERIOD_S), do_send);
        return;
    }

    build_lora_payload_u16(f, o);

    LMIC_setTxData2(1, lora_payload, sizeof(lora_payload), LORA_CONFIRMED_UPLINK);

    g_last_tx_kick_ms = now_ms;
    g_txpend_skips = 0;

    printf("📡 LoRa queued: free=%u occupied=%u payload=%02X%02X%02X%02X\n",
           (unsigned)f, (unsigned)o,
           lora_payload[0], lora_payload[1], lora_payload[2], lora_payload[3]);

    os_setTimedCallback(&sendjob, os_getTime() + sec2osticks(LORA_SEND_PERIOD_S), do_send);
}

// =====================
// Join timeout watchdog
// =====================
static void join_timeout_cb(osjob_t* j)
{
    (void)j;

    if (g_mode == MODE_LORA_JOINED || g_mode == MODE_WIFI_FALLBACK) return;

    g_join_attempts++;
    printf("⏱️ JOIN TIMEOUT (%ds). attempt=%d/%d\n",
           LORA_JOIN_TIMEOUT_S, g_join_attempts, LORA_JOIN_MAX_ATTEMPTS);

    if (g_join_attempts >= LORA_JOIN_MAX_ATTEMPTS) {
        printf("❌ LoRa JOIN failed too many times -> WIFI fallback\n");
        switch_to_wifi();
        return;
    }

    printf("🔁 retry join...\n");
    LMIC_reset();
    lmic_apply_params();
    LMIC_startJoining();

    os_setTimedCallback(&join_timeout_job,
                        os_getTime() + sec2osticks(LORA_JOIN_TIMEOUT_S),
                        join_timeout_cb);
}

// =====================
// LMIC events
// =====================
void onEvent(ev_t ev)
{
    printf("🔔 EVENT %d\n", (int)ev);

    switch (ev) {
        case EV_JOINING:
            printf("🔄 Joining...\n");
            break;

        case EV_JOINED:
            printf("✅ JOIN TTN OK\n");
            os_clearCallback(&join_timeout_job);

            // stop periodic retry timer
            lora_retry_timer_stop();

            // If coming back from fallback, stop WiFi/MQTT
            if (g_mode == MODE_WIFI_FALLBACK) {
                wifi_mqtt_stop();
            }

            // Keep ADR + TTN settings
            LMIC_setAdrMode(1);
            LMIC_setLinkCheckMode(0);
#ifdef CFG_eu868
            LMIC.rxDelay = 5;
#endif

            g_mode = MODE_LORA_JOINED;
            g_join_attempts = 0;
            g_ack_misses = 0;
            g_txpend_skips = 0;
            g_last_tx_kick_ms = 0;

            os_setTimedCallback(&sendjob, os_getTime() + sec2osticks(2), do_send);
            break;

        case EV_TXCOMPLETE: {
            bool got_ack = (LMIC.txrxFlags & TXRX_ACK);
            printf("✅ TX COMPLETE (ack=%d)\n", got_ack ? 1 : 0);

            g_txpend_skips = 0;
            g_last_tx_kick_ms = 0;

            if (g_mode != MODE_LORA_JOINED) break;

            if (LORA_CONFIRMED_UPLINK) {
                if (!got_ack) {
                    g_ack_misses++;
                    printf("⚠️ No ACK (%d/%d)\n", g_ack_misses, LORA_ACK_MAX_MISSES);
                    if (g_ack_misses >= LORA_ACK_MAX_MISSES) {
                        printf("❌ Too many missing ACK -> WIFI fallback\n");
                        switch_to_wifi();
                    }
                } else {
                    g_ack_misses = 0;
                }
            }
            break;
        }

        case EV_JOIN_FAILED:
        case EV_REJOIN_FAILED:
            printf("❌ JOIN FAILED (LMIC) -> WIFI fallback\n");
            switch_to_wifi();
            break;

        default:
            break;
    }
}

// =====================
// MAIN
// =====================
void app_main(void)
{
    esp_err_t err = nvs_flash_init();
    if (err == ESP_ERR_NVS_NO_FREE_PAGES || err == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ESP_ERROR_CHECK(nvs_flash_init());
    } else {
        ESP_ERROR_CHECK(err);
    }

    // UART + mutex + task
    g_uart_mutex = xSemaphoreCreateMutex();
    uart2_init();
    xTaskCreate(uart_reader_task, "uart_reader_task", 4096, NULL, 5, NULL);

    // WiFi tasks (act only in fallback)
    xTaskCreate(wifi_manager_task, "wifi_manager_task", 4096, NULL, 3, NULL);
    xTaskCreate(wifi_publish_task, "wifi_publish_task", 4096, NULL, 2, NULL);

    // Create periodic LoRa retry timer
    const esp_timer_create_args_t targs = {
        .callback = &lora_retry_timer_cb,
        .name = "lora_retry_periodic"
    };
    ESP_ERROR_CHECK(esp_timer_create(&targs, &g_lora_retry_timer));

    // LMIC init
    os_init();
    LMIC_reset();
    lmic_apply_params();

    printf("🚀 Start OTAA join...\n");
    g_mode = MODE_LORA_TRYJOIN;
    g_join_attempts = 0;
    g_ack_misses = 0;
    g_txpend_skips = 0;
    g_last_tx_kick_ms = 0;

    LMIC_startJoining();

    os_setTimedCallback(&join_timeout_job,
                        os_getTime() + sec2osticks(LORA_JOIN_TIMEOUT_S),
                        join_timeout_cb);

    while (1) {
        // ✅ Execute LoRa retry safely here (never in timer/handler)
        if (g_request_lora_retry) {
            g_request_lora_retry = false;

            if (g_mode == MODE_WIFI_FALLBACK) {
                ESP_LOGW(TAG, "🔁 Executing LoRa retry from main loop (fallback)");

                // Stop WiFi/MQTT (no deinit)
                wifi_mqtt_stop();

                // Cooldown to stabilize for RX1 window
                vTaskDelay(pdMS_TO_TICKS(WIFI_STOP_COOLDOWN_MS));

                os_clearCallback(&join_timeout_job);
                os_clearCallback(&sendjob);

                g_mode = MODE_LORA_TRYJOIN;
                g_join_attempts = 0;
                g_ack_misses = 0;
                g_txpend_skips = 0;
                g_last_tx_kick_ms = 0;

                LMIC_reset();
                lmic_apply_params();
                LMIC_startJoining();

                os_setTimedCallback(&join_timeout_job,
                                    os_getTime() + sec2osticks(LORA_JOIN_TIMEOUT_S),
                                    join_timeout_cb);
            }
        }

        // TXRXPEND stuck safeguard
        if (g_mode == MODE_LORA_JOINED) {
            uint32_t now_ms = (uint32_t)esp_log_timestamp();
            if ((LMIC.opmode & OP_TXRXPEND) && g_last_tx_kick_ms != 0 &&
                (now_ms - g_last_tx_kick_ms) > LORA_TXPEND_TIMEOUT_MS) {
                ESP_LOGW(TAG, "Main watchdog: TXRXPEND too long -> WIFI fallback");
                switch_to_wifi();
            }
        }

        os_runloop_once();
        vTaskDelay(1);
    }
}
