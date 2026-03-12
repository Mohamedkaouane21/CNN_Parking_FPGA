import os
import time
import json
import cv2
import numpy as np
import subprocess
import socket
import traceback

# ============================================================
# CONFIGURATION GÉNÉRALE
# ============================================================
BASE_DIR = "/home/xilinx/parking_system"

CONFIG_DIR = os.path.join(BASE_DIR, "config")
DATA_DIR   = os.path.join(BASE_DIR, "data")
LOG_DIR    = os.path.join(BASE_DIR, "logs")

IMAGE_PATH  = os.path.join(DATA_DIR, "latest.jpg")
ECHEC_PATH  = os.path.join(DATA_DIR, "echec.txt")
STATUS_PATH = os.path.join(DATA_DIR, "capture_status.json")
CROPS_DIR   = os.path.join(DATA_DIR, "crops")
COORDS_JSON = os.path.join(CONFIG_DIR, "coords.json")
SETTINGS_JSON = os.path.join(CONFIG_DIR, "settings.json")
LOG_PATH    = os.path.join(LOG_DIR, "capture.log")

RTSP_TEMPLATES = [
    "rtsp://admin:TPRESEAU!@{ip}:554/h264Preview_01_main",
    "rtsp://viewer:Lecture123@{ip}:8554/live",
    "rtsp://viewer:Lecture123@{ip}:8554/live2",
    "rtsp://{ip}:8554/live",
    "rtsp://{ip}:8554/stream",
    "rtsp://{ip}:554/stream",
]
RTSP_PORTS = [554, 8554]

DEFAULT_INTERVAL = 30
DEFAULT_CNN_SIZE = (48, 48)
PRECHECK_DELAY   = 5
RTSP_TIMEOUT     = 0.5
WARMUP_READS     = 10
MAX_LOG_BYTES    = 2 * 1024 * 1024   # 2 Mo max pour le fichier log

# ============================================================
# LOGGING avec rotation
# ============================================================
def log(msg):
    ts = time.strftime("%Y-%m-%d %H:%M:%S")
    line = f"[{ts}] {msg}"
    print(line)
    try:
        os.makedirs(LOG_DIR, exist_ok=True)
        # Rotation : si le log dépasse MAX_LOG_BYTES, on tronque
        if os.path.isfile(LOG_PATH):
            try:
                if os.path.getsize(LOG_PATH) > MAX_LOG_BYTES:
                    with open(LOG_PATH, "r") as f:
                        lines = f.readlines()
                    # Garder la moitié la plus récente
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
def write_status(state, message="", camera_ip="", rtsp_url=""):
    """Écrit un fichier status JSON lisible par l'IHM."""
    try:
        status = {
            "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
            "state": state,          # ok, searching, error, capture_failed
            "message": message,
            "camera_ip": camera_ip,
            "rtsp_url": rtsp_url
        }
        tmp = STATUS_PATH + ".tmp"
        with open(tmp, "w") as f:
            json.dump(status, f, indent=2)
        os.replace(tmp, STATUS_PATH)
    except Exception:
        pass

# ============================================================
# CONFIG DYNAMIQUE
# ============================================================
def load_settings():
    interval = DEFAULT_INTERVAL
    cnn_size = DEFAULT_CNN_SIZE
    try:
        if os.path.isfile(SETTINGS_JSON):
            with open(SETTINGS_JSON, "r") as f:
                raw = f.read().strip()
            if raw:
                s = json.loads(raw)
                if "interval" in s:
                    v = int(s["interval"])
                    if 5 <= v <= 3600:
                        interval = v
                if "cnn_size" in s:
                    v = int(s["cnn_size"])
                    if v in (48, 96, 128, 160, 192, 224):
                        cnn_size = (v, v)
    except (json.JSONDecodeError, ValueError, TypeError) as e:
        log(f"[WARN] settings.json illisible: {e}")
    except Exception as e:
        log(f"[WARN] settings.json erreur: {e}")
    return interval, cnn_size

# ============================================================
# UTILS FICHIERS
# ============================================================
def ensure_dir(path):
    os.makedirs(path, exist_ok=True)

def write_echec(msg):
    try:
        ensure_dir(DATA_DIR)
        with open(ECHEC_PATH, "w") as f:
            f.write(msg + "\n")
    except Exception:
        pass

def clear_echec():
    try:
        if os.path.exists(ECHEC_PATH):
            os.remove(ECHEC_PATH)
    except Exception:
        pass

# ============================================================
# DÉTECTION RÉSEAU
# ============================================================
def get_connected_ips():
    try:
        out = subprocess.check_output(["ip", "neigh"], text=True, timeout=5)
        ips = []
        for line in out.splitlines():
            if "dev eth0" not in line:
                continue
            parts = line.split()
            if parts and parts[0].count(".") == 3:
                ips.append(parts[0])
        return list(dict.fromkeys(ips))
    except subprocess.TimeoutExpired:
        log("[WARN] ip neigh timeout")
        return []
    except Exception as e:
        log(f"[WARN] ip neigh erreur: {e}")
        return []

def rtsp_works(ip):
    open_ports = []
    for port in RTSP_PORTS:
        try:
            with socket.create_connection((ip, port), timeout=RTSP_TIMEOUT):
                open_ports.append(port)
        except Exception:
            pass

    if not open_ports:
        return None

    for template in RTSP_TEMPLATES:
        rtsp_url = template.format(ip=ip)
        try:
            after_at = rtsp_url.split("@")[-1] if "@" in rtsp_url else rtsp_url.split("//")[1]
            port_in_url = int(after_at.split(":")[1].split("/")[0])
        except Exception:
            port_in_url = 554
        if port_in_url not in open_ports:
            continue

        cap = None
        try:
            cap = cv2.VideoCapture(rtsp_url, cv2.CAP_FFMPEG)
            if not cap.isOpened():
                continue
            for _ in range(5):
                ret, frame = cap.read()
                if ret and frame is not None:
                    return rtsp_url
        except Exception:
            pass
        finally:
            if cap is not None:
                try:
                    cap.release()
                except Exception:
                    pass

    return None

def detect_camera_ip():
    ips = get_connected_ips()
    if not ips:
        return None, None

    log(f"[INFO] IPs détectées: {ips}")

    for ip in ips:
        log(f"[INFO] Test RTSP sur {ip} ...")
        rtsp_url = rtsp_works(ip)
        if rtsp_url:
            log(f"[OK] Source RTSP détectée sur {ip}")
            log(f"     URL: {rtsp_url}")
            return ip, rtsp_url

    return None, None

# ============================================================
# CAPTURE IMAGE
# ============================================================
def capture_one_frame(rtsp_url):
    os.environ["OPENCV_FFMPEG_READ_ATTEMPTS"] = "4096"
    cap = None
    try:
        cap = cv2.VideoCapture(rtsp_url, cv2.CAP_FFMPEG)
        cap.set(cv2.CAP_PROP_OPEN_TIMEOUT_MSEC, 5000)
        cap.set(cv2.CAP_PROP_READ_TIMEOUT_MSEC, 5000)

        if not cap.isOpened():
            log("[WARN] VideoCapture: impossible d'ouvrir le flux")
            return False

        for _ in range(WARMUP_READS):
            ret, frame = cap.read()
            if ret and frame is not None:
                tmp = IMAGE_PATH + ".tmp.jpg"
                cv2.imwrite(tmp, frame)
                os.replace(tmp, IMAGE_PATH)
                return True

        log("[WARN] VideoCapture: aucune frame valide après WARMUP_READS tentatives")
        return False

    except Exception as e:
        log(f"[ERROR] capture_one_frame: {e}")
        return False
    finally:
        if cap is not None:
            try:
                cap.release()
            except Exception:
                pass

# ============================================================
# ROI CROP
# ============================================================
def order_points(pts):
    s = pts.sum(axis=1)
    diff = np.diff(pts, axis=1).reshape(-1)
    tl = pts[np.argmin(s)]
    br = pts[np.argmax(s)]
    tr = pts[np.argmin(diff)]
    bl = pts[np.argmax(diff)]
    return np.array([tl, tr, br, bl], dtype=np.float32)

def parse_coords_safe(path):
    """Lecture sécurisée de coords.json (gère les écritures partielles)."""
    for attempt in range(3):
        try:
            with open(path, "r", encoding="utf-8") as f:
                raw = f.read().strip()
            if not raw:
                return []
            data = json.loads(raw)
            if not isinstance(data, list):
                log("[WARN] coords.json: pas une liste")
                return []
            rois = []
            for i, roi in enumerate(data, start=1):
                try:
                    pts = np.array(roi, dtype=np.float32)
                    if pts.shape == (4, 2):
                        rois.append((i, pts))
                except (ValueError, TypeError):
                    log(f"[WARN] coords.json: ROI #{i} invalide, ignorée")
            return rois
        except json.JSONDecodeError:
            if attempt < 2:
                time.sleep(0.2)  # Attendre que l'IHM finisse d'écrire
            else:
                log("[WARN] coords.json: JSON invalide après 3 tentatives")
                return []
        except FileNotFoundError:
            return []
        except Exception as e:
            log(f"[WARN] coords.json: erreur lecture: {e}")
            return []

def crop_rois(cnn_size):
    ensure_dir(CROPS_DIR)

    img = cv2.imread(IMAGE_PATH)
    if img is None:
        raise RuntimeError("Image latest.jpg introuvable ou corrompue")

    rois = parse_coords_safe(COORDS_JSON)
    if not rois:
        log("[WARN] Aucune ROI valide dans coords.json")
        return 0

    w, h = cnn_size

    # Nettoyer les anciens crops
    try:
        for old in os.listdir(CROPS_DIR):
            if old.startswith("roi_") and (old.endswith(".png") or old.endswith(".jpg")):
                os.remove(os.path.join(CROPS_DIR, old))
    except Exception as e:
        log(f"[WARN] Nettoyage crops: {e}")

    dst = np.array([[0,0],[w-1,0],[w-1,h-1],[0,h-1]], dtype=np.float32)
    saved = 0

    for roi_id, pts in rois:
        try:
            pts = order_points(pts)
            M = cv2.getPerspectiveTransform(pts, dst)
            warped = cv2.warpPerspective(img, M, (w, h), flags=cv2.INTER_AREA)
            out_path = os.path.join(CROPS_DIR, f"roi_{roi_id:03d}.png")
            cv2.imwrite(out_path, warped)
            saved += 1
        except Exception as e:
            log(f"[WARN] ROI #{roi_id} crop échoué: {e}")

    return saved

# ============================================================
# MAIN LOOP
# ============================================================
def main():
    ensure_dir(DATA_DIR)
    ensure_dir(CROPS_DIR)
    ensure_dir(LOG_DIR)
    ensure_dir(CONFIG_DIR)

    if not os.path.isfile(SETTINGS_JSON):
        try:
            with open(SETTINGS_JSON, "w") as f:
                json.dump({"interval": DEFAULT_INTERVAL, "cnn_size": DEFAULT_CNN_SIZE[0]}, f, indent=2)
        except Exception:
            pass

    log("[INFO] Parking camera pipeline started")
    log(f"[INFO] Config dynamique : {SETTINGS_JSON}")

    cached_ip = None
    cached_url = None
    consecutive_failures = 0

    while True:
        try:
            interval, cnn_size = load_settings()
            log(f"[CONFIG] interval={interval}s  cnn_size={cnn_size}")

            # Détecter la caméra seulement si pas encore trouvée
            if cached_url is None:
                log("[INFO] Recherche caméra RTSP...")
                write_status("searching", "Recherche source RTSP en cours...")
                time.sleep(PRECHECK_DELAY)
                cached_ip, cached_url = detect_camera_ip()

                if cached_url is None:
                    msg = f"Aucune source RTSP détectée"
                    log(f"[ERROR] {msg}")
                    write_echec(msg)
                    write_status("error", msg)
                    time.sleep(interval)
                    continue

            log(f"[INFO] Capture depuis {cached_ip} ...")
            write_status("ok", "Capture en cours", cached_ip, cached_url)
            clear_echec()

            if not capture_one_frame(cached_url):
                consecutive_failures += 1
                msg = f"Capture échouée ({consecutive_failures}x), rescan au prochain cycle"
                log(f"[WARN] {msg}")
                write_echec(msg)
                write_status("capture_failed", msg, cached_ip, cached_url)

                # Après 3 échecs consécutifs, re-scanner le réseau
                if consecutive_failures >= 3:
                    log("[WARN] 3 échecs consécutifs, reset du cache caméra")
                    cached_ip = None
                    cached_url = None
                    consecutive_failures = 0

                time.sleep(interval)
                continue

            # Capture réussie
            consecutive_failures = 0

            try:
                n = crop_rois(cnn_size)
                log(f"[OK] Capture + {n} ROIs (caméra {cached_ip}) @ {time.strftime('%H:%M:%S')}")
                write_status("ok", f"{n} ROIs capturées", cached_ip, cached_url)
            except Exception as e:
                msg = f"ECHEC ROI: {e}"
                log(f"[ERROR] {msg}")
                write_echec(msg)

            time.sleep(interval)

        except KeyboardInterrupt:
            log("[EXIT] Arrêt propre (Ctrl+C)")
            write_status("stopped", "Arrêt manuel")
            break

        except Exception as e:
            log(f"[FATAL] Erreur non gérée dans la boucle principale:")
            log(traceback.format_exc())
            write_status("error", f"Erreur critique: {e}")
            time.sleep(10)  # Attendre avant de réessayer

if __name__ == "__main__":
    main()
