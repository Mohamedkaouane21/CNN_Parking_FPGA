// main.c — ESP32-C3 (ESP-IDF 5.x)
// LMIC (LoRaWAN OTAA) + HC-SR04 + WiFi/MQTT fallback + auto-return to LoRa (robuste)
// DR/SF uplink AUTO (ADR ON), RX1 delay TTN=5s, retry LoRa toutes les 60s même sans IP.
//
// ✅ Basculer WiFi si:
//    - JOIN LoRa timeout après N tentatives
//    - ACK manquant (confirmed uplink) trop de fois
//    - LoRa “stall” (plus de EV_TXCOMPLETE pendant X s)
//    - TXRXPEND skip trop de fois (radio bloquée)
//
// ✅ En MODE_WIFI_FALLBACK:
//    - Démarre WiFi (non-bloquant)
//    - Démarre MQTT seulement si IP
//    - Publie MQTT toutes les 5s si prêt
//    - Retente LoRa AUTOMATIQUEMENT toutes les 60s (même sans IP)
//
// ✅ Si LoRa rejoint -> stop WiFi/MQTT et retour mode LoRa
//
// ✅ MQTT JSON EXACT:
//    {"zone":"B","nb_places_libres":1,"nb_places_total":1}
//    nb_places_libres = 1 si dist_cm ∈ (0..50), sinon 0
//
// NOTE: Assure-toi que LMIC est compilé en EU868 (CFG_eu868=1) si tu es en France.

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "freertos/event_groups.h"

#include "driver/gpio.h"
#include "esp_timer.h"
#include "esp_rom_sys.h"
#include "esp_log.h"
#include "esp_err.h"

#include "nvs_flash.h"
#include "esp_netif.h"
#include "esp_event.h"
#include "esp_wifi.h"
#include "mqtt_client.h"

#include "lmic.h"
#include "hal/hal.h"

#define TAG "APP"

// =====================
// HC-SR04
// =====================
#define TRIG_GPIO         GPIO_NUM_20
#define ECHO_GPIO         GPIO_NUM_21
#define ECHO_TIMEOUT_US   30000

#define WIFI_FREE_MAX_CM  50.0f
#define SEUIL_LIBRE_CM    50.0f

// =====================
// LoRaWAN
// =====================
#define LORA_JOIN_TIMEOUT_S         30
#define LORA_JOIN_MAX_ATTEMPTS       3

#define LORA_SEND_PERIOD_S          60

#define LORA_CONFIRMED_UPLINK        1
#define LORA_ACK_MAX_MISSES          1

// Robust fallback
#define LORA_STALL_TIMEOUT_S        180   // 3 minutes sans EV_TXCOMPLETE => fallback
#define TXRXPEND_MAX_SKIPS            3  // 6 cycles => fallback

// Retry LoRa in WiFi fallback
#define WIFI_TO_LORA_RETRY_PERIOD_MS (60 * 1000) // retente LoRa toutes les 60s (même sans IP)
#define WIFI_TO_LORA_COOLDOWN_MS     1500        // WiFi->LoRa "cooldown" pour stabiliser le timing RX

// =====================
// WiFi / MQTT
// =====================
#define WIFI_SSID   "Test"
#define WIFI_PASS   "12345678"

#define MQTT_URI    "mqtt://3.225.59.240:1883"
#define MQTT_TOPIC  "DataUpdate"
#define MQTT_USER   "smartuser"
#define MQTT_PASSWD "5WAA1WvZOHEf1Z9k1kAEYd5IB4inWci2"

// =====================
// TTN OTAA (LoRa device)
// =====================
// ⚠️ Attention à l’endianness: LMIC attend généralement LSB-first pour (APPEUI/DEVEUI).
// Tu avais un code fonctionnel au démarrage, donc je garde tel quel.
// Si join ne marche jamais, il faudra inverser les octets.
static const u1_t APPEUI[8]  = { 0x50,0x41,0x98,0x1B,0x1D,0x41,0x40,0xA8 };
static const u1_t DEVEUI[8]  = { 0xD7,0x5B,0x07,0xD0,0x7E,0xD5,0xB3,0x70 };
static const u1_t APPKEY[16] = { 0x3D,0xF7,0xB6,0x57,0x43,0x55,0x9D,0x73,0xCC,0xED,0x77,0x05,0x77,0x04,0xA6,0x72 };

void os_getArtEui (u1_t* buf) { memcpy(buf, APPEUI, 8); }
void os_getDevEui (u1_t* buf) { memcpy(buf, DEVEUI, 8); }
void os_getDevKey (u1_t* buf) { memcpy(buf, APPKEY, 16); }

// =====================
// Globals
// =====================
static uint8_t payload[3];
static osjob_t sendjob;
static osjob_t join_timeout_job;
static osjob_t unpausejob;

static SemaphoreHandle_t g_dist_mutex;
static float  g_distance_cm    = 0.0f;
static bool   g_distance_valid = false;

static volatile bool g_ultra_pause = false;

typedef enum {
    MODE_LORA_TRYJOIN = 0,
    MODE_LORA_JOINED  = 1,
    MODE_WIFI_FALLBACK= 2,
} app_mode_t;

static volatile app_mode_t g_mode = MODE_LORA_TRYJOIN;
static int g_join_attempts = 0;
static int g_ack_misses    = 0;

// LoRa robustness
static int g_txrxpend_skips = 0;
static int64_t g_last_txcomplete_us = 0;

// WiFi state
static EventGroupHandle_t wifi_event_group = NULL;
#define WIFI_GOTIP_BIT   BIT0

static volatile bool g_wifi_started = false;
static volatile bool g_wifi_inited  = false;
static volatile bool g_netif_inited = false;
static volatile bool g_event_loop_inited = false;

static esp_mqtt_client_handle_t g_mqtt = NULL;
static volatile bool g_mqtt_ready   = false;
static volatile bool g_mqtt_started = false;

// LoRa retry timer (sets flag only)
static volatile bool g_request_lora_retry = false;
static esp_timer_handle_t g_lora_retry_timer = NULL;

// =====================
// Helpers
// =====================
static const char* wifi_disc_reason_str(uint8_t r)
{
    switch (r) {
        case WIFI_REASON_NO_AP_FOUND:            return "NO_AP_FOUND";
        case WIFI_REASON_AUTH_FAIL:              return "AUTH_FAIL";
        case WIFI_REASON_4WAY_HANDSHAKE_TIMEOUT: return "4WAY_HANDSHAKE_TIMEOUT";
        case WIFI_REASON_ASSOC_FAIL:             return "ASSOC_FAIL";
        default:                                 return "OTHER";
    }
}

static inline bool distance_is_valid(float d)
{
    return (d > 0.0f && d <= 500.0f);
}

// =====================
// LMIC apply params (AUTO DR/SF)
// =====================
// - DR/SF uplink: auto (ADR ON)
// - RX1 delay TTN: 5s
// - tolérance horloge élevée (esp32 + wifi)
static void lmic_apply_params_auto(void)
{
    // tolérance timing (surtout après WiFi)
    LMIC_setClockError(MAX_CLOCK_ERROR * 10 / 100);

#ifdef CFG_eu868
    // TTN RX1 delay = 5s (CRUCIAL pour recevoir join-accept)
    LMIC.rxDelay = 5;

    // optionnel: forcer seulement la fréquence RX2 (sans forcer le DR)
    LMIC.dn2Freq = 869525000;
#endif

    LMIC_setLinkCheckMode(0);

    // ADR ON => DR/SF auto via réseau (recommandé)
    LMIC_setAdrMode(1);
}

// =====================
// HC-SR04
// =====================
static void hcsr04_init(void)
{
    gpio_config_t io = {0};

    io.intr_type    = GPIO_INTR_DISABLE;
    io.mode         = GPIO_MODE_OUTPUT;
    io.pin_bit_mask = (1ULL << TRIG_GPIO);
    ESP_ERROR_CHECK(gpio_config(&io));
    gpio_set_level(TRIG_GPIO, 0);

    io.mode         = GPIO_MODE_INPUT;
    io.pin_bit_mask = (1ULL << ECHO_GPIO);
    io.pull_down_en = 1;
    ESP_ERROR_CHECK(gpio_config(&io));
}

static float hcsr04_measure_cm_once(void)
{
    int64_t t_wait = esp_timer_get_time();
    while (gpio_get_level(ECHO_GPIO) == 1) {
        if ((esp_timer_get_time() - t_wait) > 2000) return -1.0f;
    }

    gpio_set_level(TRIG_GPIO, 0);
    esp_rom_delay_us(2);
    gpio_set_level(TRIG_GPIO, 1);
    esp_rom_delay_us(10);
    gpio_set_level(TRIG_GPIO, 0);

    int64_t t0 = esp_timer_get_time();
    while (gpio_get_level(ECHO_GPIO) == 0) {
        if ((esp_timer_get_time() - t0) > ECHO_TIMEOUT_US) return -1.0f;
    }

    int64_t start = esp_timer_get_time();
    while (gpio_get_level(ECHO_GPIO) == 1) {
        if ((esp_timer_get_time() - start) > ECHO_TIMEOUT_US) return -1.0f;
    }
    int64_t end = esp_timer_get_time();

    float dur_us = (float)(end - start);
    return (dur_us * 0.0343f) * 0.5f;
}

static float hcsr04_measure_cm_filtered(void)
{
    float v[5];
    int n = 0;

    for (int i = 0; i < 5; i++) {
        float d = hcsr04_measure_cm_once();
        if (distance_is_valid(d)) v[n++] = d;
        vTaskDelay(pdMS_TO_TICKS(60));
    }

    if (n == 0) return -1.0f;

    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++)
            if (v[j] < v[i]) { float tmp = v[i]; v[i] = v[j]; v[j] = tmp; }

    return v[n / 2];
}

static void ultrasonic_task(void *arg)
{
    (void)arg;
    while (1) {
        if (g_ultra_pause) {
            vTaskDelay(pdMS_TO_TICKS(120));
            continue;
        }

        float d = hcsr04_measure_cm_filtered();
        bool valid = distance_is_valid(d);

        xSemaphoreTake(g_dist_mutex, portMAX_DELAY);
        if (valid) {
            g_distance_cm    = d;
            g_distance_valid = true;
        }
        xSemaphoreGive(g_dist_mutex);

        printf("Distance = %.2f cm | valid=%d | echo_idle=%d\n",
               d, valid ? 1 : 0, gpio_get_level(ECHO_GPIO));

        vTaskDelay(pdMS_TO_TICKS(400));
    }
}

// =====================
// LoRa payload encode (3 bytes)
// b0 = etat (0/1)  (placeLibre)
// b1..b2 = distance * 10 en int16 signed
// =====================
static void encode_ultrason(float dist_cm, bool placeLibre)
{
    payload[0] = placeLibre ? 1 : 0;

    int16_t d10 = (dist_cm < 0.0f) ? (int16_t)-1 : (int16_t)(dist_cm * 10.0f);
    payload[1] = (uint8_t)((d10 >> 8) & 0xFF);
    payload[2] = (uint8_t)(d10 & 0xFF);
}

// =====================
// LMIC failsafe unpause
// =====================
static void safety_unpause(osjob_t *j)
{
    (void)j;
    g_ultra_pause = false;
    printf("⚠️ safety_unpause: reprise capteur (failsafe)\n");
}

// Forward declarations
static void join_timeout_cb(osjob_t* j);
static void do_send(osjob_t* j);
static void switch_to_wifi(void);
static void wifi_mqtt_stop(void);

// =====================
// WiFi/MQTT events
// =====================
static void wifi_event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data)
{
    (void)arg;

    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        ESP_LOGI(TAG, "WIFI_STA_START -> connect()");
        esp_wifi_connect();
        return;
    }

    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        wifi_event_sta_disconnected_t *e = (wifi_event_sta_disconnected_t*)event_data;
        ESP_LOGE(TAG, "STA_DISCONNECTED reason=%d (%s)", e->reason, wifi_disc_reason_str(e->reason));

        g_mqtt_ready = false;
        if (wifi_event_group) xEventGroupClearBits(wifi_event_group, WIFI_GOTIP_BIT);

        // IMPORTANT: pas de vTaskDelay dans un handler
        esp_wifi_connect();
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
    (void)handler_args;
    (void)base;

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
// WiFi/MQTT init/start/stop (non-bloquant)
// =====================
static void wifi_init_once(void)
{
    if (g_wifi_inited) return;

    if (!g_netif_inited) {
        esp_err_t err = esp_netif_init();
        if (err != ESP_OK && err != ESP_ERR_INVALID_STATE) ESP_ERROR_CHECK(err);
        g_netif_inited = true;
    }

    if (!g_event_loop_inited) {
        esp_err_t err = esp_event_loop_create_default();
        if (err != ESP_OK && err != ESP_ERR_INVALID_STATE) ESP_ERROR_CHECK(err);
        g_event_loop_inited = true;
    }

    if (!wifi_event_group) wifi_event_group = xEventGroupCreate();

    // Create default STA (only once)
    esp_netif_create_default_wifi_sta();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    wifi_country_t country = { .cc = "FR", .schan = 1, .nchan = 13, .policy = WIFI_COUNTRY_POLICY_AUTO };
    ESP_ERROR_CHECK(esp_wifi_set_country(&country));

    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler, NULL));

    wifi_config_t w = {0};
    snprintf((char*)w.sta.ssid, sizeof(w.sta.ssid), "%s", WIFI_SSID);
    snprintf((char*)w.sta.password, sizeof(w.sta.password), "%s", WIFI_PASS);
    w.sta.scan_method = WIFI_ALL_CHANNEL_SCAN;
    w.sta.sort_method = WIFI_CONNECT_AP_BY_SIGNAL;
    w.sta.failure_retry_cnt = 10;
    w.sta.threshold.authmode = (strlen(WIFI_PASS) == 0) ? WIFI_AUTH_OPEN : WIFI_AUTH_WPA2_PSK;
    w.sta.pmf_cfg.capable = false;
    w.sta.pmf_cfg.required = false;

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &w));
    ESP_ERROR_CHECK(esp_wifi_set_ps(WIFI_PS_NONE));

    g_wifi_inited = true;
}

static void wifi_start_nonblocking(void)
{
    if (g_wifi_started) return;
    wifi_init_once();

    ESP_LOGW(TAG, "=== START WIFI (FALLBACK) ===");
    xEventGroupClearBits(wifi_event_group, WIFI_GOTIP_BIT);

    ESP_ERROR_CHECK(esp_wifi_start());
    g_wifi_started = true;
}

static void mqtt_start_once(void)
{
    if (g_mqtt_started) return;

    esp_mqtt_client_config_t mqtt_cfg = {
        .broker.address.uri = MQTT_URI,
        .session.keepalive  = 60,
        .credentials.username = MQTT_USER,
        .credentials.authentication.password = MQTT_PASSWD,
    };

    g_mqtt = esp_mqtt_client_init(&mqtt_cfg);
    ESP_ERROR_CHECK(esp_mqtt_client_register_event(g_mqtt, ESP_EVENT_ANY_ID, mqtt_event_handler, NULL));
    ESP_ERROR_CHECK(esp_mqtt_client_start(g_mqtt));
    g_mqtt_started = true;
}

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
// WiFi manager task (fallback mode)
// - démarre WiFi tout de suite
// - démarre MQTT seulement si IP obtenue
// =====================
static void wifi_manager_task(void *arg)
{
    (void)arg;

    while (1) {
        if (g_mode == MODE_WIFI_FALLBACK) {
            wifi_start_nonblocking();

            if (wifi_event_group) {
                EventBits_t b = xEventGroupGetBits(wifi_event_group);
                if (b & WIFI_GOTIP_BIT) {
                    mqtt_start_once();
                }
            }
        }
        vTaskDelay(pdMS_TO_TICKS(250));
    }
}

// =====================
// MQTT publish task
// =====================
static void wifi_publish_task(void *arg)
{
    (void)arg;

    while (1) {
        if (g_mode != MODE_WIFI_FALLBACK) {
            vTaskDelay(pdMS_TO_TICKS(500));
            continue;
        }

        float d;
        bool valid;

        xSemaphoreTake(g_dist_mutex, portMAX_DELAY);
        d     = g_distance_cm;
        valid = g_distance_valid;
        xSemaphoreGive(g_dist_mutex);

        if (g_mqtt && g_mqtt_ready && valid) {
            int nb_places_total  = 1;
            int nb_places_libres = (d > 0.0f && d < WIFI_FREE_MAX_CM) ? 0 : 1;

            char msg[96];
            snprintf(msg, sizeof(msg),
                     "{\"zone\":\"B\",\"nb_places_libres\":%d,\"nb_places_total\":%d}",
                     nb_places_libres, nb_places_total);

            int id = esp_mqtt_client_publish(g_mqtt, MQTT_TOPIC, msg, 0, 0, 0);
            ESP_LOGI(TAG, "MQTT publish id=%d => %s", id, msg);
        } else {
            ESP_LOGW(TAG, "MQTT not ready (mqtt=%p ready=%d) valid=%d got_ip=%d",
                     (void*)g_mqtt, (int)g_mqtt_ready, (int)valid,
                     (wifi_event_group && (xEventGroupGetBits(wifi_event_group) & WIFI_GOTIP_BIT)) ? 1 : 0);
        }

        vTaskDelay(pdMS_TO_TICKS(5000));
    }
}

// =====================
// LoRa retry timer callback (periodic in fallback)
// IMPORTANT: no LMIC calls here, only set flag
// =====================
static void lora_retry_timer_cb(void *arg)
{
    (void)arg;
    if (g_mode == MODE_WIFI_FALLBACK) {
        ESP_LOGW(TAG, "⏱️ Periodic LoRa retry tick (60s) -> request LoRa retry");
        g_request_lora_retry = true;
    }
}

static void lora_retry_timer_start_periodic(void)
{
    if (!g_lora_retry_timer) return;
    esp_timer_stop(g_lora_retry_timer);
    ESP_ERROR_CHECK(esp_timer_start_periodic(
        g_lora_retry_timer, (uint64_t)WIFI_TO_LORA_RETRY_PERIOD_MS * 1000ULL
    ));
}

static void lora_retry_timer_stop(void)
{
    if (!g_lora_retry_timer) return;
    esp_timer_stop(g_lora_retry_timer);
}

// =====================
// Mode switching
// =====================
static void switch_to_wifi(void)
{
    if (g_mode == MODE_WIFI_FALLBACK) return;

    ESP_LOGW(TAG, "Switching to WIFI fallback mode");

    os_clearCallback(&sendjob);
    os_clearCallback(&join_timeout_job);
    os_clearCallback(&unpausejob);

    g_ultra_pause = false;
    g_mode = MODE_WIFI_FALLBACK;

    // retry LoRa toutes les 60s, même sans IP
    lora_retry_timer_start_periodic();
}

// =====================
// Join timeout callback
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
    g_ultra_pause = true;

    LMIC_reset();
    lmic_apply_params_auto();  // ✅ IMPORTANT après reset
    LMIC_startJoining();

    os_setTimedCallback(&join_timeout_job,
                        os_getTime() + sec2osticks(LORA_JOIN_TIMEOUT_S),
                        join_timeout_cb);
}

// =====================
// LMIC send (LoRa)
// =====================
static void do_send(osjob_t* j)
{
    (void)j;

    if (g_mode != MODE_LORA_JOINED) return;

    os_setTimedCallback(&sendjob, os_getTime() + sec2osticks(LORA_SEND_PERIOD_S), do_send);

    if (LMIC.opmode & OP_TXRXPEND) {
        g_txrxpend_skips++;
        printf("📡 do_send: TXRXPEND -> skip (%d/%d)\n", g_txrxpend_skips, TXRXPEND_MAX_SKIPS);

        if (g_txrxpend_skips >= TXRXPEND_MAX_SKIPS) {
            ESP_LOGE(TAG, "Too many TXRXPEND skips -> WIFI fallback");
            switch_to_wifi();
        }
        return;
    }
    g_txrxpend_skips = 0;

    float d;
    bool valid;

    xSemaphoreTake(g_dist_mutex, portMAX_DELAY);
    d     = g_distance_cm;
    valid = g_distance_valid;
    xSemaphoreGive(g_dist_mutex);

    if (!valid) {
        printf("📡 do_send: no valid distance -> skip\n");
        return;
    }

    bool placeLibre = (d >= SEUIL_LIBRE_CM);
    printf("📡 do_send: dist=%.2fcm etat=%s\n", d, placeLibre ? "LIBRE" : "OCCUPEE");

    g_ultra_pause = true;

    encode_ultrason(d, placeLibre);
    LMIC_setTxData2(1, payload, sizeof(payload), LORA_CONFIRMED_UPLINK);

    os_clearCallback(&unpausejob);
    os_setTimedCallback(&unpausejob, os_getTime() + sec2osticks(10), safety_unpause);
}

// =====================
// LoRa watchdog task (stall detection)
// =====================
static void lora_watchdog_task(void *arg)
{
    (void)arg;

    while (1) {
        if (g_mode == MODE_LORA_JOINED) {
            int64_t now = esp_timer_get_time();
            if (g_last_txcomplete_us != 0) {
                int64_t dt_s = (now - g_last_txcomplete_us) / 1000000;
                if (dt_s > LORA_STALL_TIMEOUT_S) {
                    ESP_LOGE(TAG, "LoRa stall: no EV_TXCOMPLETE for %llds -> WIFI fallback",
                             (long long)dt_s);
                    switch_to_wifi();
                }
            }
        }
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
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
            g_ultra_pause = true;
            break;

        case EV_JOINED:
            printf("✅ JOIN TTN OK\n");
            os_clearCallback(&join_timeout_job);

            // stop fallback components if coming back
            if (g_mode == MODE_WIFI_FALLBACK) {
                wifi_mqtt_stop();
            }

            // stop periodic retry timer
            lora_retry_timer_stop();

            g_mode = MODE_LORA_JOINED;
            g_ultra_pause = false;
            g_ack_misses = 0;
            g_txrxpend_skips = 0;
            g_last_txcomplete_us = esp_timer_get_time();

            os_setTimedCallback(&sendjob, os_getTime() + sec2osticks(2), do_send);
            break;

        case EV_TXCOMPLETE: {
            printf("✅ TX COMPLETE\n");
            os_clearCallback(&unpausejob);
            g_ultra_pause = false;

            g_last_txcomplete_us = esp_timer_get_time();

            bool got_ack = (LMIC.txrxFlags & TXRX_ACK);
            printf("📩 ACK=%d\n", got_ack ? 1 : 0);

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
            printf("❌ JOIN FAILED (LMIC)\n");
            break;

        default:
            break;
    }
}

// =====================
// app_main
// =====================
void app_main(void)
{
    // NVS
    esp_err_t err = nvs_flash_init();
    if (err == ESP_ERR_NVS_NO_FREE_PAGES || err == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ESP_ERROR_CHECK(nvs_flash_init());
    } else {
        ESP_ERROR_CHECK(err);
    }

    // LoRa retry timer create
    const esp_timer_create_args_t targs = {
        .callback = &lora_retry_timer_cb,
        .name = "lora_retry_periodic"
    };
    ESP_ERROR_CHECK(esp_timer_create(&targs, &g_lora_retry_timer));

    g_dist_mutex = xSemaphoreCreateMutex();

    // Sensor
    hcsr04_init();
    xTaskCreate(ultrasonic_task, "ultrasonic_task", 4096, NULL, 1, NULL);

    // WiFi/MQTT tasks
    xTaskCreate(wifi_manager_task, "wifi_manager_task", 4096, NULL, 3, NULL);
    xTaskCreate(wifi_publish_task, "wifi_publish_task", 4096, NULL, 2, NULL);

    // LoRa watchdog
    xTaskCreate(lora_watchdog_task, "lora_watchdog_task", 4096, NULL, 5, NULL);

    // LMIC init
    os_init();
    LMIC_reset();
    lmic_apply_params_auto(); // ✅ IMPORTANT (rxDelay=5, clockErr=10%, ADR ON)

    printf("🚀 Start OTAA join...\n");
    g_mode = MODE_LORA_TRYJOIN;
    g_join_attempts = 0;
    g_ack_misses = 0;
    g_txrxpend_skips = 0;
    g_last_txcomplete_us = 0;
    g_ultra_pause = true;

    LMIC_startJoining();

    os_setTimedCallback(&join_timeout_job,
                        os_getTime() + sec2osticks(LORA_JOIN_TIMEOUT_S),
                        join_timeout_cb);

    while (1) {
        // Execute LoRa retry safely here (never inside timer/event handler)
        if (g_request_lora_retry) {
            g_request_lora_retry = false;

            if (g_mode == MODE_WIFI_FALLBACK) {
                ESP_LOGW(TAG, "🔁 Executing LoRa retry from main loop (fallback)");

                // Stop WiFi/MQTT to avoid RF/CPU contention
                wifi_mqtt_stop();

                // Cooldown after WiFi stop (stabilise timing)
                vTaskDelay(pdMS_TO_TICKS(WIFI_TO_LORA_COOLDOWN_MS));

                // Clear LMIC scheduled jobs
                os_clearCallback(&join_timeout_job);
                os_clearCallback(&sendjob);
                os_clearCallback(&unpausejob);

                // Reset LoRa state + rejoin
                g_mode = MODE_LORA_TRYJOIN;
                g_join_attempts = 0;
                g_ack_misses = 0;
                g_txrxpend_skips = 0;
                g_ultra_pause = true;

                LMIC_reset();
                lmic_apply_params_auto(); // ✅ IMPORTANT après reset
                LMIC_startJoining();

                os_setTimedCallback(&join_timeout_job,
                                    os_getTime() + sec2osticks(LORA_JOIN_TIMEOUT_S),
                                    join_timeout_cb);
            }
        }

        os_runloop_once();
        vTaskDelay(1);
    }
}
