// main.c — ESP32-WROOM (ESP-IDF 5.x)
// LMIC (LoRaWAN OTAA EU868) + UART2 reader + WiFi/MQTT fallback (ROBUSTE)
//
// ✅ UART2 reçoit depuis FPGA: {"zone":"A","nb_places_libres":5,"nb_places_total":10,"device":"camera"}\r\n
// ✅ Parse zone, nb_places_libres, nb_places_total, device
// ✅ LoRa payload: 4 octets (uint16 BE): [libres_hi][libres_lo][total_hi][total_lo], FPort=1
// ✅ WiFi/MQTT: publie JSON:
//    {"zone":"A","nb_places_libres":5,"nb_places_total":10,"device":"camera","raw_hex":"..."}
//
// ✅ WiFi SCAN AUTO:
//    - Scan tous les AP visibles au démarrage du fallback
//    - Sélectionne le meilleur AP ouvert (RSSI max)
//    - g_scan_in_progress bloque connect() pendant le scan → corrige reason=210
//    - Si aucun AP ouvert → WiFi ignoré, retry LoRa toutes les 60s
//
// ✅ Fallback WiFi si JOIN LoRa échoue / ACK manquants / TXRXPEND stuck
// ✅ Retry LoRa toutes les 60s même sans IP WiFi
// ✅ RX1 delay TTN = 5s
// ✅ Fallback propre SANS esp_wifi_deinit()
//
// ⚠️ Après CHAQUE LMIC_reset(), on ré-applique ADR + rxDelay + clockError + linkcheck.

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

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
// MQTT
// =====================
#define MQTT_URI    "mqtt://3.225.59.240:1883"
#define MQTT_TOPIC  "DataUpdate"
#define MQTT_USER    "smartuser"
#define MQTT_PASSWD  "5WAA1WvZOHEf1Z9k1kAEYd5IB4inWci2"

// =====================
// WiFi SCAN
// =====================
#define WIFI_SCAN_MAX_AP   20   // max AP analysés par scan

// =====================
// UART2
// =====================
#define UART_PORT        UART_NUM_2
#define UART_TX          17
#define UART_RX          16
#define UART_BAUD        115200
#define UART_RX_BUF_SIZE 1024

// =====================
// LoRaWAN policy
// =====================
#define LORA_JOIN_TIMEOUT_S      30
#define LORA_JOIN_MAX_ATTEMPTS    2
#define LORA_SEND_PERIOD_S       60

#define LORA_CONFIRMED_UPLINK     1
#define LORA_ACK_MAX_MISSES       3

// Retry LoRa en fallback même sans IP
#define LORA_RETRY_PERIOD_MS     (60 * 1000)
#define WIFI_STOP_COOLDOWN_MS    1500

// =====================
// TXRXPEND watchdog
// =====================
static int      g_txpend_skips    = 0;
static uint32_t g_last_tx_kick_ms = 0;
#define LORA_TXPEND_MAX_SKIPS    5
#define LORA_TXPEND_TIMEOUT_MS   30000

// =====================
// TTN OTAA (EU868)
// =====================
static const u1_t APPEUI[8]  = { 0x50,0x41,0x98,0x1B,0x1D,0x41,0x40,0xA8 };
static const u1_t DEVEUI[8]  = { 0x34,0x5B,0x07,0xD0,0x7E,0xD5,0xB3,0x70 };
static const u1_t APPKEY[16] = { 0x00,0x12,0xF2,0x1B,0xFA,0xF2,0x24,0x62,
                                  0x07,0xCA,0x68,0xE3,0xF4,0x62,0x40,0x81 };

void os_getArtEui (u1_t* buf) { memcpy(buf, APPEUI, 8); }
void os_getDevEui (u1_t* buf) { memcpy(buf, DEVEUI, 8); }
void os_getDevKey (u1_t* buf) { memcpy(buf, APPKEY, 16); }

// =====================
// Modes
// =====================
typedef enum {
    MODE_LORA_TRYJOIN  = 0,
    MODE_LORA_JOINED   = 1,
    MODE_WIFI_FALLBACK = 2,
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

static bool     g_uart_decoded_ok     = false;
static uint16_t g_uart_libres         = 0;
static uint16_t g_uart_total          = 0;
static char     g_uart_zone[8]        = {0};   // ex: "A"
static char     g_uart_device[64]     = {0};   // ex: "capteur1"

// LoRa payload (4 bytes)
static uint8_t lora_payload[4];

// =====================
// WiFi scan state
// =====================
static char g_selected_ssid[33]       = {0};
static bool g_open_ap_found           = false;
static volatile bool g_scan_in_progress = false;

// =====================
// WiFi/MQTT state
// =====================
static EventGroupHandle_t wifi_event_group = NULL;
#define WIFI_GOTIP_BIT   BIT0
#define WIFI_STOPPED_BIT BIT1

static esp_mqtt_client_handle_t g_mqtt = NULL;
static volatile bool g_mqtt_ready   = false;
static volatile bool g_mqtt_started = false;

static volatile bool g_wifi_inited     = false;
static volatile bool g_wifi_started    = false;
static volatile bool g_netif_inited    = false;
static volatile bool g_eventloop_inited= false;

// Retry LoRa flag (set by timer, executed in main loop)
static volatile bool g_request_lora_retry = false;
static esp_timer_handle_t g_lora_retry_timer = NULL;

// =====================
// Forward declarations
// =====================
static void join_timeout_cb(osjob_t* j);
static void do_send(osjob_t* j);
static void switch_to_wifi(void);
static void wifi_mqtt_stop(void);
static void wifi_event_handler(void* arg, esp_event_base_t base,
                               int32_t event_id, void* event_data);
static void mqtt_event_handler(void *handler_args, esp_event_base_t base,
                               int32_t event_id, void *event_data);

// =====================
// Helpers
// =====================
static const char* wifi_disc_reason_str(uint8_t r)
{
    switch (r) {
        case WIFI_REASON_NO_AP_FOUND:            return "NO_AP_FOUND";
        case WIFI_REASON_AUTH_FAIL:               return "AUTH_FAIL";
        case WIFI_REASON_4WAY_HANDSHAKE_TIMEOUT:  return "4WAY_HANDSHAKE_TIMEOUT";
        case WIFI_REASON_ASSOC_FAIL:              return "ASSOC_FAIL";
        default:                                  return "OTHER";
    }
}

static int bytes_to_hex(const uint8_t *in, int in_len, char *out, int out_sz)
{
    static const char *HEX = "0123456789ABCDEF";
    int needed = in_len * 2 + 1;
    if (out_sz < needed) return -1;
    for (int i = 0; i < in_len; i++) {
        out[i*2+0] = HEX[(in[i] >> 4) & 0x0F];
        out[i*2+1] = HEX[in[i] & 0x0F];
    }
    out[in_len*2] = '\0';
    return in_len * 2;
}

static void rstrip(char *s)
{
    int n = (int)strlen(s);
    while (n > 0) {
        char c = s[n - 1];
        if (c == '\r' || c == '\n' || c == ' ' || c == '\t') { s[--n] = '\0'; }
        else break;
    }
}

// =====================
// UART JSON Parser — helpers
// =====================

// Extrait un entier après "key": dans un JSON string
static int json_extract_int(const char *json, const char *key, int *out_val)
{
    const char *p = strstr(json, key);
    if (!p) return 0;
    const char *c = strchr(p, ':');
    if (!c) return 0;
    c++; while (*c == ' ' || *c == '\t') c++;
    int v;
    if (sscanf(c, "%d", &v) != 1) return 0;
    *out_val = v;
    return 1;
}

// Extrait une chaîne après "key": "..." dans un JSON string
static int json_extract_str(const char *json, const char *key,
                             char *out, int out_sz)
{
    const char *p = strstr(json, key);
    if (!p) return 0;
    const char *c = strchr(p, ':');
    if (!c) return 0;
    c++; while (*c == ' ' || *c == '\t') c++;
    if (*c != '"') return 0;
    c++;
    const char *end = strchr(c, '"');
    if (!end) return 0;
    int n = (int)(end - c);
    if (n >= out_sz) n = out_sz - 1;
    memcpy(out, c, n);
    out[n] = '\0';
    return 1;
}

// =====================
// UART JSON Parser
// Format FPGA:
//   {"zone":"A","nb_places_libres":5,"nb_places_total":10,"device":"camera"}
// =====================
static bool decode_uart_json(const uint8_t *buf, int len,
                              uint16_t *out_libres, uint16_t *out_total,
                              char *out_zone,    int zone_sz,
                              char *out_device,  int device_sz)
{
    if (!buf || len <= 0) return false;

    char s[512];
    int slen = (len < (int)sizeof(s) - 1) ? len : (int)sizeof(s) - 1;
    memcpy(s, buf, slen);
    s[slen] = '\0';
    rstrip(s);

    // ── Parse nb_places_libres et nb_places_total ────────────────────────
    // Format FPGA: {"zone":"A","nb_places_libres":5,"nb_places_total":10,"device":"camera"}
    int libres = -1, total = -1;

    json_extract_int(s, "\"nb_places_libres\"", &libres);
    json_extract_int(s, "\"nb_places_total\"",  &total);

    if (libres < 0 || libres > 65535 || total < 0 || total > 65535) return false;

    *out_libres = (uint16_t)libres;
    *out_total  = (uint16_t)total;

    // ── Parse zone (optionnel) ─────────────────────────────────────────────
    if (out_zone && zone_sz > 0) {
        out_zone[0] = '\0';
        json_extract_str(s, "\"zone\"", out_zone, zone_sz);
    }

    // ── Parse device (optionnel) ───────────────────────────────────────────
    if (out_device && device_sz > 0) {
        out_device[0] = '\0';
        json_extract_str(s, "\"device\"", out_device, device_sz);
    }

    return true;
}

static void build_lora_payload(uint16_t libres, uint16_t total)
{
    lora_payload[0] = (uint8_t)((libres >> 8) & 0xFF);
    lora_payload[1] = (uint8_t)(libres & 0xFF);
    lora_payload[2] = (uint8_t)((total >> 8) & 0xFF);
    lora_payload[3] = (uint8_t)(total & 0xFF);
}

// =====================
// ADR + TTN RX1 delay = 5s
// =====================
static void lmic_apply_params(void)
{
    LMIC_setClockError(MAX_CLOCK_ERROR * 10 / 100);
    LMIC_setAdrMode(1);
    LMIC_setLinkCheckMode(0);
#ifdef CFG_eu868
    LMIC.rxDelay = 5;
#endif
}

// =====================
// UART init + reader task
// =====================
static void uart2_init(void)
{
    const uart_config_t cfg = {
        .baud_rate  = UART_BAUD,
        .data_bits  = UART_DATA_8_BITS,
        .parity     = UART_PARITY_DISABLE,
        .stop_bits  = UART_STOP_BITS_1,
        .flow_ctrl  = UART_HW_FLOWCTRL_DISABLE,
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
        if (len <= 0) continue;

        uint16_t libres = 0, total = 0;
        char zone[8]   = {0};
        char device[64]= {0};

        bool ok = decode_uart_json(data, len,
                                   &libres, &total,
                                   zone,   sizeof(zone),
                                   device, sizeof(device));

        xSemaphoreTake(g_uart_mutex, portMAX_DELAY);

        int copy_len = (len > UART_RX_BUF_SIZE) ? UART_RX_BUF_SIZE : len;
        memcpy(g_uart_last, data, copy_len);
        g_uart_last_len = copy_len;

        if (ok) {
            g_uart_decoded_ok = true;
            g_uart_libres     = libres;
            g_uart_total      = total;
            strncpy(g_uart_zone,   zone,   sizeof(g_uart_zone)   - 1);
            strncpy(g_uart_device, device, sizeof(g_uart_device) - 1);
            ESP_LOGI(TAG, "DECODE OK => zone=\"%s\" libres=%u total=%u device=\"%s\"",
                     zone, (unsigned)libres, (unsigned)total, device);
        } else {
            g_uart_decoded_ok = false;
            // Affiche les données brutes pour diagnostic
            // Limite à 200 chars pour éviter de spammer le log
            int print_len = (len > 200) ? 200 : len;
            char tmp_str[201];
            memcpy(tmp_str, data, print_len);
            tmp_str[print_len] = '\0';
            // Remplace les caractères non-imprimables par '.'
            for (int i = 0; i < print_len; i++) {
                if (tmp_str[i] < 0x20 || tmp_str[i] > 0x7E) tmp_str[i] = '.';
            }
            ESP_LOGW(TAG, "DECODE FAIL (len=%d) raw=[%s]", len, tmp_str);
        }

        xSemaphoreGive(g_uart_mutex);
    }
}

// =====================
// WiFi SCAN — sélection meilleur AP ouvert (RSSI max)
// Doit être appelé avec WiFi déjà démarré.
// =====================
static bool wifi_scan_and_pick_open(wifi_config_t *out_cfg)
{
    wifi_scan_config_t scan_cfg = {
        .ssid        = NULL,
        .bssid       = NULL,
        .channel     = 0,
        .show_hidden = false,
        .scan_type   = WIFI_SCAN_TYPE_ACTIVE,
    };

    ESP_LOGW(TAG, "🔍 Scan WiFi en cours...");
    esp_err_t err = esp_wifi_scan_start(&scan_cfg, true); // bloquant
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "Scan échoué: %s", esp_err_to_name(err));
        return false;
    }

    uint16_t count = 0;
    esp_wifi_scan_get_ap_num(&count);
    if (count == 0) {
        ESP_LOGW(TAG, "Aucun AP détecté");
        return false;
    }
    if (count > WIFI_SCAN_MAX_AP) count = WIFI_SCAN_MAX_AP;

    wifi_ap_record_t *list = malloc(count * sizeof(wifi_ap_record_t));
    if (!list) { ESP_LOGE(TAG, "malloc AP list failed"); return false; }

    esp_wifi_scan_get_ap_records(&count, list);

    ESP_LOGI(TAG, "📡 %d AP trouvés:", count);

    int    best_idx  = -1;
    int8_t best_rssi = -127;

    for (int i = 0; i < count; i++) {
        bool is_open = (list[i].authmode == WIFI_AUTH_OPEN);
        ESP_LOGI(TAG, "  [%2d] %-32s  RSSI=%4d  auth=%d %s",
                 i, list[i].ssid, list[i].rssi, list[i].authmode,
                 is_open ? "<<< OUVERT" : "");
        if (is_open && list[i].rssi > best_rssi) {
            best_rssi = list[i].rssi;
            best_idx  = i;
        }
    }

    if (best_idx < 0) {
        ESP_LOGW(TAG, "⚠️ Aucun AP ouvert parmi %d AP", count);
        free(list);
        return false;
    }

    ESP_LOGW(TAG, "✅ AP ouvert sélectionné: \"%s\" (RSSI=%d)",
             list[best_idx].ssid, list[best_idx].rssi);

    memset(g_selected_ssid, 0, sizeof(g_selected_ssid));
    memcpy(g_selected_ssid, list[best_idx].ssid,
           strnlen((char*)list[best_idx].ssid, 32));

    memset(out_cfg, 0, sizeof(wifi_config_t));
    memcpy(out_cfg->sta.ssid, list[best_idx].ssid, 32);
    out_cfg->sta.scan_method       = WIFI_ALL_CHANNEL_SCAN;
    out_cfg->sta.sort_method       = WIFI_CONNECT_AP_BY_SIGNAL;
    out_cfg->sta.failure_retry_cnt = 5;
    out_cfg->sta.threshold.authmode= WIFI_AUTH_OPEN;
    out_cfg->sta.pmf_cfg.capable   = false;
    out_cfg->sta.pmf_cfg.required  = false;

    free(list);
    return true;
}

// =====================
// Scan + configure STA (WiFi doit être démarré)
// g_scan_in_progress bloque connect() pendant le scan
// =====================
static void wifi_do_scan_and_configure(void)
{
    g_scan_in_progress = true;
    ESP_LOGW(TAG, "🔍 Scan démarré (connect() bloqué pendant scan)");

    wifi_config_t w = {0};
    g_open_ap_found = wifi_scan_and_pick_open(&w);

    if (g_open_ap_found) {
        ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &w));
        ESP_LOGW(TAG, "✅ Config STA appliquée → \"%s\"", g_selected_ssid);
    } else {
        ESP_LOGW(TAG, "⚠️ Aucun AP ouvert trouvé lors du scan");
    }

    g_scan_in_progress = false;
}

// =====================
// WiFi/MQTT event handlers
// =====================
static void wifi_event_handler(void* arg, esp_event_base_t event_base,
                               int32_t event_id, void* event_data)
{
    (void)arg;

    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        // Ne PAS appeler esp_wifi_connect() ici :
        // wifi_start_if_needed() fait scan → config → connect() explicite.
        // Un connect() ici = reason=210 (NO_AP_FOUND) car SSID pas encore connu.
        ESP_LOGI(TAG, "WIFI_STA_START (scan + connect géré par wifi_start_if_needed)");
        return;
    }

    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        wifi_event_sta_disconnected_t *e = (wifi_event_sta_disconnected_t*)event_data;
        ESP_LOGW(TAG, "STA_DISCONNECTED reason=%d (%s)",
                 e->reason, wifi_disc_reason_str(e->reason));

        g_mqtt_ready = false;
        if (wifi_event_group) xEventGroupClearBits(wifi_event_group, WIFI_GOTIP_BIT);

        if (g_scan_in_progress) {
            ESP_LOGW(TAG, "STA_DISCONNECTED ignoré (scan en cours)");
            return;
        }

        if (e->reason == WIFI_REASON_NO_AP_FOUND ||
            e->reason == WIFI_REASON_AUTH_FAIL    ||
            e->reason == WIFI_REASON_ASSOC_FAIL) {
            // AP introuvable ou auth échoué :
            // → stop WiFi proprement, force rescan complet au prochain cycle manager
            ESP_LOGW(TAG, "AP perdu/introuvable (reason=%d) → stop + rescan", e->reason);
            g_open_ap_found = false;
            g_wifi_started  = false;   // permet à wifi_start_if_needed() de relancer
            esp_wifi_stop();           // → STA_STOP → WIFI_STOPPED_BIT
            return;
        }

        // Déconnexion passagère (ex: signal faible, AP reboot) → reconnect direct
        ESP_LOGW(TAG, "Déconnexion passagère (reason=%d) → reconnect", e->reason);
        esp_wifi_connect();
        return;
    }

    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_STOP) {
        if (wifi_event_group) xEventGroupSetBits(wifi_event_group, WIFI_STOPPED_BIT);
        return;
    }

    if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t *e = (ip_event_got_ip_t*)event_data;
        ESP_LOGI(TAG, "GOT_IP: " IPSTR, IP2STR(&e->ip_info.ip));
        if (wifi_event_group) xEventGroupSetBits(wifi_event_group, WIFI_GOTIP_BIT);
        return;
    }
}

static void mqtt_event_handler(void *handler_args, esp_event_base_t base,
                               int32_t event_id, void *event_data)
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
// WiFi init (driver + events + pays — sans start ni scan)
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

    if (!wifi_event_group) {
        wifi_event_group = xEventGroupCreate();
    }

    esp_netif_create_default_wifi_sta();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    wifi_country_t country = {
        .cc = "FR", .schan = 1, .nchan = 13, .policy = WIFI_COUNTRY_POLICY_AUTO
    };
    ESP_ERROR_CHECK(esp_wifi_set_country(&country));

    // Event handlers enregistrés AVANT tout start/scan
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID,
                                               &wifi_event_handler, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP,
                                               &wifi_event_handler, NULL));

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_ps(WIFI_PS_NONE));

    g_wifi_inited = true;
    ESP_LOGI(TAG, "WiFi driver initialisé");
}

// =====================
// WiFi start + scan + connect
// Séquence correcte anti-reason=210 :
//   1) Config vide → pas de connect auto au STA_START
//   2) start
//   3) Scan bloquant (g_scan_in_progress=true)
//   4) Config STA avec SSID trouvé
//   5) connect() explicite
// =====================
static void wifi_start_if_needed(void)
{
    if (g_wifi_started) return;
    wifi_init_once();

    ESP_LOGW(TAG, "=== START WIFI (FALLBACK) — scan en cours... ===");

    if (wifi_event_group) {
        xEventGroupClearBits(wifi_event_group, WIFI_GOTIP_BIT);
        xEventGroupClearBits(wifi_event_group, WIFI_STOPPED_BIT);
    }

    // Config vide → bloque connect auto sur STA_START
    wifi_config_t empty = {0};
    esp_wifi_set_config(WIFI_IF_STA, &empty);

    ESP_ERROR_CHECK(esp_wifi_start());
    g_wifi_started = true;

    if (g_open_ap_found) {
        // AP déjà connu → connexion directe sans rescan
        ESP_LOGW(TAG, "AP déjà connu: \"%s\" → connexion directe", g_selected_ssid);
        wifi_config_t w = {0};
        memcpy(w.sta.ssid, g_selected_ssid, 32);
        w.sta.scan_method        = WIFI_ALL_CHANNEL_SCAN;
        w.sta.sort_method        = WIFI_CONNECT_AP_BY_SIGNAL;
        w.sta.failure_retry_cnt  = 5;
        w.sta.threshold.authmode = WIFI_AUTH_OPEN;
        ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &w));
    } else {
        // Scan complet
        wifi_do_scan_and_configure();

        if (!g_open_ap_found) {
            ESP_LOGW(TAG, "Pas d'AP ouvert → stop WiFi, retry LoRa dans 60s");
            esp_wifi_stop();
            g_wifi_started = false;
            return;
        }
    }

    ESP_LOGW(TAG, "=== CONNECT → \"%s\" ===", g_selected_ssid);
    esp_wifi_connect();
}

static void mqtt_start_if_needed(void)
{
    if (g_mqtt_started) return;

    esp_mqtt_client_config_t mqtt_cfg = {
        .broker.address.uri               = MQTT_URI,
        .session.keepalive                 = 60,
        .credentials.username              = MQTT_USER,
        .credentials.authentication.password = MQTT_PASSWD,
    };

    g_mqtt = esp_mqtt_client_init(&mqtt_cfg);
    ESP_ERROR_CHECK(esp_mqtt_client_register_event(g_mqtt, ESP_EVENT_ANY_ID,
                                                   mqtt_event_handler, NULL));
    ESP_ERROR_CHECK(esp_mqtt_client_start(g_mqtt));
    g_mqtt_started = true;
}

// Stop propre: pas de esp_wifi_deinit()
static void wifi_mqtt_stop(void)
{
    if (g_mqtt) {
        ESP_LOGW(TAG, "Stopping MQTT...");
        esp_mqtt_client_stop(g_mqtt);
        esp_mqtt_client_destroy(g_mqtt);
        g_mqtt = NULL;
    }
    g_mqtt_ready   = false;
    g_mqtt_started = false;

    if (g_wifi_started) {
        ESP_LOGW(TAG, "Stopping WiFi...");
        esp_wifi_disconnect();
        esp_wifi_stop(); // → WIFI_EVENT_STA_STOP → WIFI_STOPPED_BIT
    }
    g_wifi_started = false;

    if (wifi_event_group) {
        xEventGroupClearBits(wifi_event_group, WIFI_GOTIP_BIT);
    }
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

// =====================
// MQTT publish task
// Nouveau format JSON avec zone, nb_places_libres, nb_places_total, device
// =====================
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
            int     len    = 0;
            bool    ok     = false;
            uint16_t libres = 0, total = 0;
            char zone[8]   = {0};
            char device[64]= {0};

            xSemaphoreTake(g_uart_mutex, portMAX_DELAY);
            len    = g_uart_last_len;
            if (len > 0) memcpy(tmp, g_uart_last, len);
            ok     = g_uart_decoded_ok;
            libres = g_uart_libres;
            total  = g_uart_total;
            strncpy(zone,   g_uart_zone,   sizeof(zone)   - 1);
            strncpy(device, g_uart_device, sizeof(device) - 1);
            xSemaphoreGive(g_uart_mutex);

            if (len > 0) {
                int hex_chars = bytes_to_hex(tmp, len, hexbuf, sizeof(hexbuf));
                if (hex_chars < 0) { hexbuf[0] = '\0'; hex_chars = 0; }
                int print_hex = (hex_chars > 120) ? 120 : hex_chars;

                char msg[384];
                if (ok) {
                    // Format complet avec tous les champs parsés
                    snprintf(msg, sizeof(msg),
                             "{\"zone\":\"%s\","
                             "\"nb_places_libres\":%u,"
                             "\"nb_places_total\":%u,"
                             "\"device\":\"%s\","
                             "\"raw_hex\":\"%.*s\"}",
                             zone[0] ? zone : "?",
                             (unsigned)libres,
                             (unsigned)total,
                             device[0] ? device : "?",
                             print_hex, hexbuf);
                } else {
                    // Format dégradé si décodage échoué
                    snprintf(msg, sizeof(msg),
                             "{\"device\":\"uart2\",\"len\":%d,\"raw_hex\":\"%.*s\"}",
                             len, print_hex, hexbuf);
                }

                int id = esp_mqtt_client_publish(g_mqtt, MQTT_TOPIC, msg, 0, 0, 0);
                ESP_LOGI(TAG, "MQTT publish id=%d ssid=\"%s\" => %s",
                         id, g_selected_ssid, msg);
            } else {
                ESP_LOGW(TAG, "No UART data yet -> skip MQTT");
            }
        } else {
            int got_ip = (wifi_event_group &&
                          (xEventGroupGetBits(wifi_event_group) & WIFI_GOTIP_BIT)) ? 1 : 0;
            ESP_LOGW(TAG, "MQTT not ready (mqtt=%p ready=%d got_ip=%d ssid=\"%s\")",
                     (void*)g_mqtt, (int)g_mqtt_ready, got_ip,
                     g_selected_ssid[0] ? g_selected_ssid : "none");
        }

        vTaskDelay(pdMS_TO_TICKS(5000));
    }
}

// =====================
// Periodic LoRa retry timer — set flag only, jamais d'appel LMIC ici
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
    ESP_ERROR_CHECK(esp_timer_start_periodic(
        g_lora_retry_timer, (uint64_t)LORA_RETRY_PERIOD_MS * 1000ULL));
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

    g_mode            = MODE_WIFI_FALLBACK;
    g_txpend_skips    = 0;
    g_last_tx_kick_ms = 0;

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

        if (g_last_tx_kick_ms != 0 &&
            (now_ms - g_last_tx_kick_ms) > LORA_TXPEND_TIMEOUT_MS) {
            printf("❌ TXRXPEND stuck > %dms -> WIFI fallback\n", LORA_TXPEND_TIMEOUT_MS);
            switch_to_wifi();
            return;
        }
        if (g_txpend_skips >= LORA_TXPEND_MAX_SKIPS) {
            printf("❌ Too many TXRXPEND skips -> WIFI fallback\n");
            switch_to_wifi();
            return;
        }

        os_setTimedCallback(&sendjob,
                            os_getTime() + sec2osticks(LORA_SEND_PERIOD_S), do_send);
        return;
    }

    bool     ok     = false;
    uint16_t libres = 0, total = 0;
    char     zone[8]   = {0};
    char     device[64]= {0};

    xSemaphoreTake(g_uart_mutex, portMAX_DELAY);
    ok     = g_uart_decoded_ok;
    libres = g_uart_libres;
    total  = g_uart_total;
    strncpy(zone,   g_uart_zone,   sizeof(zone)   - 1);
    strncpy(device, g_uart_device, sizeof(device) - 1);
    xSemaphoreGive(g_uart_mutex);

    if (!ok) {
        printf("📡 No decoded UART yet -> skip LoRa\n");
        os_setTimedCallback(&sendjob,
                            os_getTime() + sec2osticks(LORA_SEND_PERIOD_S), do_send);
        return;
    }

    build_lora_payload(libres, total);

    LMIC_setTxData2(1, lora_payload, sizeof(lora_payload), LORA_CONFIRMED_UPLINK);

    g_last_tx_kick_ms = now_ms;
    g_txpend_skips    = 0;

    printf("📡 LoRa queued: zone=\"%s\" libres=%u total=%u device=\"%s\" "
           "payload=%02X%02X%02X%02X\n",
           zone, (unsigned)libres, (unsigned)total, device,
           lora_payload[0], lora_payload[1], lora_payload[2], lora_payload[3]);

    os_setTimedCallback(&sendjob,
                        os_getTime() + sec2osticks(LORA_SEND_PERIOD_S), do_send);
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
            lora_retry_timer_stop();

            if (g_mode == MODE_WIFI_FALLBACK) {
                wifi_mqtt_stop();
            }

            LMIC_setAdrMode(1);
            LMIC_setLinkCheckMode(0);
#ifdef CFG_eu868
            LMIC.rxDelay = 5;
#endif
            g_mode            = MODE_LORA_JOINED;
            g_join_attempts   = 0;
            g_ack_misses      = 0;
            g_txpend_skips    = 0;
            g_last_tx_kick_ms = 0;

            os_setTimedCallback(&sendjob, os_getTime() + sec2osticks(2), do_send);
            break;

        case EV_TXCOMPLETE: {
            bool got_ack = (LMIC.txrxFlags & TXRX_ACK);
            printf("✅ TX COMPLETE (ack=%d)\n", got_ack ? 1 : 0);

            g_txpend_skips    = 0;
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
    xTaskCreate(uart_reader_task,  "uart_reader_task",  4096, NULL, 5, NULL);

    // WiFi/MQTT tasks (actives seulement en fallback)
    xTaskCreate(wifi_manager_task, "wifi_manager_task", 4096, NULL, 3, NULL);
    xTaskCreate(wifi_publish_task, "wifi_publish_task", 4096, NULL, 2, NULL);

    // Periodic LoRa retry timer
    const esp_timer_create_args_t targs = {
        .callback = &lora_retry_timer_cb,
        .name     = "lora_retry_periodic"
    };
    ESP_ERROR_CHECK(esp_timer_create(&targs, &g_lora_retry_timer));

    // LMIC init
    os_init();
    LMIC_reset();
    lmic_apply_params();

    printf("🚀 Start OTAA join...\n");
    g_mode            = MODE_LORA_TRYJOIN;
    g_join_attempts   = 0;
    g_ack_misses      = 0;
    g_txpend_skips    = 0;
    g_last_tx_kick_ms = 0;

    LMIC_startJoining();

    os_setTimedCallback(&join_timeout_job,
                        os_getTime() + sec2osticks(LORA_JOIN_TIMEOUT_S),
                        join_timeout_cb);

    // =====================
    // Boucle principale
    // =====================
    while (1) {
        // Retry LoRa (jamais dans timer/handler — thread-safe avec LMIC)
        if (g_request_lora_retry) {
            g_request_lora_retry = false;

            if (g_mode == MODE_WIFI_FALLBACK) {
                ESP_LOGW(TAG, "🔁 Executing LoRa retry from main loop");

                // 1) Stop WiFi/MQTT
                if (wifi_event_group) {
                    xEventGroupClearBits(wifi_event_group, WIFI_STOPPED_BIT);
                }
                wifi_mqtt_stop();

                // 2) Attendre stop réel (max 3s)
                if (wifi_event_group) {
                    xEventGroupWaitBits(wifi_event_group, WIFI_STOPPED_BIT,
                                        pdTRUE, pdTRUE, pdMS_TO_TICKS(3000));
                }

                // 3) Cooldown stabilisation RX1
                vTaskDelay(pdMS_TO_TICKS(WIFI_STOP_COOLDOWN_MS));

                // 4) Clear jobs LMIC
                os_clearCallback(&join_timeout_job);
                os_clearCallback(&sendjob);

                // 5) Reset état
                g_mode            = MODE_LORA_TRYJOIN;
                g_join_attempts   = 0;
                g_ack_misses      = 0;
                g_txpend_skips    = 0;
                g_last_tx_kick_ms = 0;

                // 6) Rejoin LoRa
                LMIC_reset();
                lmic_apply_params();
                LMIC_startJoining();

                os_setTimedCallback(&join_timeout_job,
                                    os_getTime() + sec2osticks(LORA_JOIN_TIMEOUT_S),
                                    join_timeout_cb);
            }
        }

        // TXRXPEND watchdog dans la boucle principale
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
