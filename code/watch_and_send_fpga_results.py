#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
watch_and_send_fpga_results.py — Envoi résumé parking vers ESP32 via UART

Format envoyé :
  {"zone":"A","nb_places_libres":5,"nb_places_total":36,"device":"camera"}
"""

import os
import time
import json
import traceback
import serial

# ============================================================
# CONFIG
# ============================================================
BASE_DIR     = "/home/xilinx/parking_system"
RESULTS_JSON       = os.path.join(BASE_DIR, "data", "fpga_results.json")
SUMMARY_JSON       = os.path.join(BASE_DIR, "data", "parking_summary.json")
STATUS_PATH        = os.path.join(BASE_DIR, "data", "uart_status.json")
CAPTURE_STATUS_PATH = os.path.join(BASE_DIR, "data", "capture_status.json")
LOG_PATH           = os.path.join(BASE_DIR, "logs", "uart_send.log")

SERIAL_PORT  = "/dev/ttyUSB0"
SERIAL_BAUD  = 115200
SERIAL_ZONE  = "A"

POLL_SEC       = 2.0
SERIAL_RETRY   = 10.0    # secondes entre tentatives de reconnexion série
MAX_LOG_BYTES  = 2 * 1024 * 1024


# ============================================================
# LOGGING avec rotation
# ============================================================
def log(msg):
    ts = time.strftime("%Y-%m-%d %H:%M:%S")
    line = f"[{ts}] {msg}"
    print(line)
    try:
        os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)
        if os.path.isfile(LOG_PATH):
            try:
                if os.path.getsize(LOG_PATH) > MAX_LOG_BYTES:
                    with open(LOG_PATH, "r") as f:
                        lines = f.readlines()
                    with open(LOG_PATH, "w") as f:
                        f.writelines(lines[len(lines)//2:])
            except Exception:
                pass
        with open(LOG_PATH, "a") as f:
            f.write(line + "\n")
    except Exception:
        pass


# ============================================================
# STATUS (pour l'IHM)
# ============================================================
def write_status(state, message="", n_libre=0, n_total=0):
    try:
        status = {
            "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
            "state": state,
            "message": message,
            "nb_places_libres": n_libre,
            "nb_places_total": n_total,
            "serial_port": SERIAL_PORT
        }
        tmp = STATUS_PATH + ".tmp"
        with open(tmp, "w") as f:
            json.dump(status, f, indent=2)
        os.replace(tmp, STATUS_PATH)
    except Exception:
        pass


# ============================================================
# LECTURE SÉCURISÉE JSON
# ============================================================
def read_results_safe():
    """
    Lit fpga_results.json de manière sécurisée.
    Gère les écritures partielles (JSON tronqué) en réessayant.
    Retourne (nb_libres, nb_total) ou None.
    """
    for attempt in range(3):
        try:
            with open(RESULTS_JSON, "r") as f:
                raw = f.read().strip()
            if not raw:
                return None

            data = json.loads(raw)
            items = data.get("items", [])
            if not items:
                return None

            n_libre = 0
            n_total = 0
            for item in items:
                label = item.get("label", "").upper()
                if label in ("FREE", "OCCUPIED"):
                    n_total += 1
                    if label == "FREE":
                        n_libre += 1

            return n_libre, n_total

        except json.JSONDecodeError:
            if attempt < 2:
                time.sleep(0.15)  # Attendre que l'écriture atomique finisse
            else:
                log("[WARN] fpga_results.json: JSON invalide après 3 tentatives")
                return None
        except FileNotFoundError:
            return None
        except Exception as e:
            log(f"[WARN] Lecture fpga_results.json: {e}")
            return None


def camera_is_ok():
    """
    Vérifie capture_status.json pour savoir si la caméra RTSP est détectée.
    Retourne True si state == 'ok', False sinon (error, searching, capture_failed, absent).
    """
    try:
        with open(CAPTURE_STATUS_PATH, "r") as f:
            raw = f.read().strip()
        if not raw:
            return False
        data = json.loads(raw)
        return data.get("state") == "ok"
    except (FileNotFoundError, json.JSONDecodeError):
        return False
    except Exception as e:
        log(f"[WARN] Lecture capture_status.json: {e}")
        return False


def build_summary(n_libre, n_total):
    return {
        "zone": SERIAL_ZONE,
        "nb_places_libres": n_libre,
        "nb_places_total": n_total,
        "device": "camera"
    }


def save_summary(summary):
    try:
        os.makedirs(os.path.dirname(SUMMARY_JSON), exist_ok=True)
        tmp = SUMMARY_JSON + ".tmp"
        with open(tmp, "w") as f:
            json.dump(summary, f, indent=2)
        os.replace(tmp, SUMMARY_JSON)
    except Exception as e:
        log(f"[WARN] Écriture summary: {e}")


# ============================================================
# SÉRIE avec reconnexion automatique
# ============================================================
def init_serial():
    if not os.path.exists(SERIAL_PORT):
        log(f"[WARN] Port {SERIAL_PORT} introuvable (ESP32 non branché ?)")
        return None
    try:
        ser = serial.Serial(SERIAL_PORT, SERIAL_BAUD, timeout=1)
        time.sleep(2)
        log(f"[OK] Série ouverte : {SERIAL_PORT} @ {SERIAL_BAUD}")
        return ser
    except serial.SerialException as e:
        log(f"[WARN] Ouverture série: {e}")
        return None
    except Exception as e:
        log(f"[WARN] Série indisponible: {e}")
        return None


def send_serial(ser, summary):
    if ser is None or not ser.is_open:
        return False
    try:
        msg = json.dumps(summary, separators=(",", ":")) + "\n"
        ser.write(msg.encode("utf-8"))
        ser.flush()
        return True
    except serial.SerialException as e:
        log(f"[WARN] Envoi série échoué: {e}")
        return False
    except Exception as e:
        log(f"[WARN] Erreur envoi: {e}")
        return False


def close_serial(ser):
    if ser is not None:
        try:
            ser.close()
        except Exception:
            pass


# ============================================================
# MAIN
# ============================================================
def main():
    os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)

    log("=======================================================")
    log("  SMART PARKING — Envoi UART vers ESP32")
    log("=======================================================")
    log(f"  RESULTS  : {RESULTS_JSON}")
    log(f"  SUMMARY  : {SUMMARY_JSON}")
    log(f"  UART     : {SERIAL_PORT} @ {SERIAL_BAUD}")
    log(f"  ZONE     : {SERIAL_ZONE}")
    log(f"  POLL     : {POLL_SEC}s")
    log("=======================================================")

    ser = init_serial()
    last_mtime = 0
    last_summary = None
    last_serial_try = 0
    last_cam_ok = True   # pour détecter le changement d'état caméra

    while True:
        try:
            # ── Vérifier si la caméra RTSP est détectée ──
            cam_ok = camera_is_ok()

            if not cam_ok:
                # Caméra non détectée → envoyer -1/-1
                summary = build_summary(-1, -1)
                save_summary(summary)

                if summary != last_summary:
                    last_summary = summary

                    if not last_cam_ok:
                        # Déjà signalé, juste un log discret
                        pass
                    else:
                        log("[WARN] Caméra RTSP non détectée → envoi -1/-1 à l'ESP32")

                    last_cam_ok = False

                    # Reconnexion série si nécessaire
                    if (ser is None or not ser.is_open):
                        now = time.time()
                        if now - last_serial_try >= SERIAL_RETRY:
                            last_serial_try = now
                            ser = init_serial()

                    if send_serial(ser, summary):
                        log(f"[OK] Envoyé: {json.dumps(summary)}")
                        write_status("ok", "Caméra hors ligne → -1/-1 envoyé", -1, -1)
                    else:
                        log("[WARN] Envoi échoué (série non disponible)")
                        write_status("serial_error", "ESP32 non connecté", -1, -1)
                        close_serial(ser)
                        ser = None

                time.sleep(POLL_SEC)
                continue

            # ── Caméra OK : traitement normal ──
            if not last_cam_ok:
                log("[INFO] Caméra RTSP retrouvée, reprise du fonctionnement normal")
                last_cam_ok = True

            # Vérifier si fpga_results.json a changé
            try:
                mtime = os.path.getmtime(RESULTS_JSON)
            except FileNotFoundError:
                time.sleep(POLL_SEC)
                continue

            if mtime == last_mtime:
                time.sleep(POLL_SEC)
                continue

            last_mtime = mtime

            result = read_results_safe()
            if result is None:
                time.sleep(POLL_SEC)
                continue

            n_libre, n_total = result
            summary = build_summary(n_libre, n_total)

            # Toujours sauvegarder le résumé (même si série indisponible)
            save_summary(summary)

            # Ne renvoyer que si le résumé a changé
            if summary != last_summary:
                last_summary = summary

                log(f"[TX] Libres: {n_libre}/{n_total} → ESP32")

                # Reconnexion série si nécessaire
                if (ser is None or not ser.is_open):
                    now = time.time()
                    if now - last_serial_try >= SERIAL_RETRY:
                        last_serial_try = now
                        ser = init_serial()

                if send_serial(ser, summary):
                    log(f"[OK] Envoyé: {json.dumps(summary)}")
                    write_status("ok", "Données envoyées", n_libre, n_total)
                else:
                    log("[WARN] Envoi échoué (série non disponible)")
                    write_status("serial_error", "ESP32 non connecté", n_libre, n_total)
                    # Fermer et retenter au prochain cycle
                    close_serial(ser)
                    ser = None

            time.sleep(POLL_SEC)

        except serial.SerialException as e:
            log(f"[WARN] Série perdue: {e}")
            close_serial(ser)
            ser = None
            write_status("serial_error", str(e))
            time.sleep(SERIAL_RETRY)

        except KeyboardInterrupt:
            log("[EXIT] Arrêt propre")
            close_serial(ser)
            write_status("stopped", "Arrêt manuel")
            break

        except Exception as e:
            log(f"[FATAL] {e}")
            log(traceback.format_exc())
            write_status("error", str(e))
            time.sleep(5.0)


if __name__ == "__main__":
    main()
