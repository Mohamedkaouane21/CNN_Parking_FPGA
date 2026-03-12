#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
send_uart.py — Envoi resume parking vers ESP32 via USB/UART

Surveille fpga_results.json et envoie un JSON vers l'ESP32
a CHAQUE actualisation du fichier.

Format envoye :
{"zone":"A","device":"camera","nb_places_libres":3,"nb_places_total":7}

Connexion : PYNQ-Z2 (USB) -> ESP32 (Serial)
Baudrate  : 115200
"""

import os
import time
import json
import serial
import glob

# ============================================================
# CONFIG
# ============================================================
BASE_DIR       = "/home/xilinx/parking_system"
FPGA_JSON      = os.path.join(BASE_DIR, "data", "fpga_results.json")
SUMMARY_JSON   = os.path.join(BASE_DIR, "data", "parking_summary.json")
LOG_PATH       = os.path.join(BASE_DIR, "logs", "uart_esp32.log")

ZONE_NAME      = "A"
DEVICE_NAME    = "camera"
SERIAL_PORT    = "/dev/ttyUSB0"
BAUD_RATE      = 115200
SERIAL_TIMEOUT = 2
POLL_SEC       = 3.0


# ============================================================
# Utils
# ============================================================
def log(msg: str):
    ts = time.strftime("%Y-%m-%d %H:%M:%S")
    line = f"[{ts}] {msg}"
    print(line, flush=True)
    try:
        os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)
        with open(LOG_PATH, "a") as f:
            f.write(line + "\n")
    except Exception:
        pass


def detect_serial_port():
    candidates = glob.glob("/dev/ttyUSB*") + glob.glob("/dev/ttyACM*")
    if candidates:
        candidates.sort()
        return candidates[0]
    return SERIAL_PORT


def read_fpga_results():
    try:
        with open(FPGA_JSON, "r") as f:
            data = json.load(f)
        summary = data.get("summary", {})
        return {
            "free": summary.get("free", 0),
            "total": summary.get("total", 0),
        }
    except Exception:
        return None


def build_json(results):
    return {
        "zone": ZONE_NAME,
        "device": DEVICE_NAME,
        "nb_places_libres": results["free"],
        "nb_places_total": results["total"],
    }


# ============================================================
# Main
# ============================================================
def main():
    os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)
    os.makedirs(os.path.dirname(SUMMARY_JSON), exist_ok=True)

    log("=" * 55)
    log("  UART -> ESP32 — Envoi resume parking")
    log("=" * 55)
    log(f"  FPGA_JSON   = {FPGA_JSON}")
    log(f"  POLL_SEC    = {POLL_SEC}")

    port = detect_serial_port()
    log(f"  SERIAL_PORT = {port}")
    log(f"  BAUD_RATE   = {BAUD_RATE}")
    log("=" * 55)

    ser = None
    last_mtime = 0

    while True:
        try:
            # -- Ouvrir le port serie si necessaire --
            if ser is None or not ser.is_open:
                port = detect_serial_port()
                try:
                    ser = serial.Serial(port, BAUD_RATE, timeout=SERIAL_TIMEOUT)
                    time.sleep(1)
                    log(f"[OK] Port serie ouvert : {port}")
                except Exception as e:
                    log(f"[WARN] Port serie indisponible ({port}) : {e}")
                    ser = None
                    time.sleep(5)
                    continue

            # -- Verifier si fpga_results.json a ete actualise --
            if not os.path.exists(FPGA_JSON):
                time.sleep(POLL_SEC)
                continue

            try:
                mtime = os.path.getmtime(FPGA_JSON)
            except Exception:
                time.sleep(POLL_SEC)
                continue

            if mtime == last_mtime:
                time.sleep(POLL_SEC)
                continue

            last_mtime = mtime

            # -- Lire les resultats --
            results = read_fpga_results()
            if results is None:
                time.sleep(POLL_SEC)
                continue

            # -- Construire et envoyer le JSON --
            summary = build_json(results)
            payload = json.dumps(summary, separators=(",", ":")) + "\r\n"
            ser.write(payload.encode("utf-8"))
            ser.flush()

            log(f"[TX] {ZONE_NAME} : {summary['nb_places_libres']}/{summary['nb_places_total']} libres -> ESP32")

            # -- Sauvegarder en local --
            try:
                tmp = SUMMARY_JSON + ".tmp"
                with open(tmp, "w") as f:
                    json.dump(summary, f, indent=2)
                os.replace(tmp, SUMMARY_JSON)
            except Exception:
                pass

            # -- Lire reponse ESP32 (optionnel) --
            if ser.in_waiting > 0:
                response = ser.readline().decode("utf-8", errors="ignore").strip()
                if response:
                    log(f"[RX] ESP32 : {response}")

        except serial.SerialException as e:
            log(f"[ERROR] Connexion serie perdue : {e}")
            if ser:
                try:
                    ser.close()
                except Exception:
                    pass
            ser = None
            time.sleep(5)

        except Exception as e:
            log(f"[ERROR] {e}")
            time.sleep(2)

        time.sleep(POLL_SEC)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        log("[INFO] Arret propre (Ctrl+C)")
