"""
gestion_des_frames.py — Pipeline parking intelligent (PYNQ-Z2)
Lit les paramètres depuis config/settings.json à chaque cycle.
Écrit status.json enrichi (compteur journalier, erreurs, timing).
"""

import os
import time
import json
import cv2
import numpy as np
import subprocess
import socket

# ============================================================
# CHEMINS FIXES
# ============================================================
BASE_DIR    = "/home/xilinx/parking_system"
CODE_DIR    = os.path.join(BASE_DIR, "code")
CONFIG_DIR  = os.path.join(BASE_DIR, "config")
DATA_DIR    = os.path.join(BASE_DIR, "data")
LOG_DIR     = os.path.join(BASE_DIR, "logs")

IMAGE_PATH    = os.path.join(DATA_DIR, "latest.jpg")
ECHEC_PATH    = os.path.join(DATA_DIR, "echec.txt")
CROPS_DIR     = os.path.join(DATA_DIR, "crops")
COORDS_JSON   = os.path.join(CONFIG_DIR, "coords.json")
SETTINGS_JSON = os.path.join(CONFIG_DIR, "settings.json")
STATUS_JSON   = os.path.join(DATA_DIR, "status.json")

# ============================================================
# VALEURS PAR DÉFAUT
# ============================================================
DEFAULT_SETTINGS = {
    "interval": 30,
    "cnn_size": [224, 224],
    "rtsp_template": "rtsp://admin:TPRESEAU!@{ip}:554/h264Preview_01_main",
    "rtsp_timeout": 0.5,
    "warmup_reads": 10,
    "precheck_delay": 5,
}

# ============================================================
# COMPTEURS ET HISTORIQUE (en mémoire, persistés dans status.json)
# ============================================================
pipeline_stats = {
    "start_time": None,
    "_start_ts": 0,
    "today": None,
    "captures_today": 0,
    "errors_today": 0,
    "total_captures": 0,
    "total_errors": 0,
    "total_cycles": 0,
    "last_capture_duration": 0,
    "last_error": None,
    "last_error_time": None,
    "error_log": [],
}

MAX_ERROR_LOG = 20


def reset_daily_counters():
    """Remet les compteurs journaliers à zéro si la date a changé."""
    today = time.strftime("%Y-%m-%d")
    if pipeline_stats["today"] != today:
        pipeline_stats["today"] = today
        pipeline_stats["captures_today"] = 0
        pipeline_stats["errors_today"] = 0


def log_error(msg):
    """Enregistre une erreur dans l'historique."""
    ts = time.strftime("%Y-%m-%d %H:%M:%S")
    pipeline_stats["errors_today"] += 1
    pipeline_stats["total_errors"] += 1
    pipeline_stats["last_error"] = msg
    pipeline_stats["last_error_time"] = ts
    pipeline_stats["error_log"].append({"time": ts, "message": msg})
    if len(pipeline_stats["error_log"]) > MAX_ERROR_LOG:
        pipeline_stats["error_log"] = pipeline_stats["error_log"][-MAX_ERROR_LOG:]


def log_capture_success():
    """Incrémente les compteurs de capture."""
    pipeline_stats["captures_today"] += 1
    pipeline_stats["total_captures"] += 1


# ============================================================
# CHARGEMENT DYNAMIQUE DES PARAMÈTRES
# ============================================================
def load_settings():
    settings = DEFAULT_SETTINGS.copy()
    if not os.path.exists(SETTINGS_JSON):
        return settings

    try:
        with open(SETTINGS_JSON, "r", encoding="utf-8") as f:
            user = json.load(f)

        if isinstance(user.get("interval"), (int, float)) and user["interval"] >= 5:
            settings["interval"] = int(user["interval"])
        cnn = user.get("cnn_size")
        if (isinstance(cnn, list) and len(cnn) == 2
                and all(isinstance(v, int) and 32 <= v <= 1024 for v in cnn)):
            settings["cnn_size"] = cnn
        if isinstance(user.get("rtsp_template"), str) and "{ip}" in user["rtsp_template"]:
            settings["rtsp_template"] = user["rtsp_template"]
        if isinstance(user.get("rtsp_timeout"), (int, float)) and user["rtsp_timeout"] > 0:
            settings["rtsp_timeout"] = float(user["rtsp_timeout"])
        if isinstance(user.get("warmup_reads"), int) and user["warmup_reads"] >= 1:
            settings["warmup_reads"] = user["warmup_reads"]
        if isinstance(user.get("precheck_delay"), (int, float)) and user["precheck_delay"] >= 0:
            settings["precheck_delay"] = int(user["precheck_delay"])
    except Exception as e:
        print(f"[WARN] Erreur lecture settings.json: {e}")

    return settings


# ============================================================
# UTILS FICHIERS
# ============================================================
def ensure_dir(path):
    os.makedirs(path, exist_ok=True)

def write_echec(msg):
    ensure_dir(DATA_DIR)
    with open(ECHEC_PATH, "w") as f:
        f.write(msg + "\n")

def clear_echec():
    if os.path.exists(ECHEC_PATH):
        os.remove(ECHEC_PATH)

def write_status(status_dict):
    """Écrit status.json enrichi avec les stats du pipeline."""
    status_dict["pipeline_stats"] = {
        "start_time": pipeline_stats["start_time"],
        "uptime_seconds": int(time.time() - pipeline_stats["_start_ts"]),
        "today": pipeline_stats["today"],
        "captures_today": pipeline_stats["captures_today"],
        "errors_today": pipeline_stats["errors_today"],
        "total_captures": pipeline_stats["total_captures"],
        "total_errors": pipeline_stats["total_errors"],
        "total_cycles": pipeline_stats["total_cycles"],
        "last_capture_duration": round(pipeline_stats["last_capture_duration"], 2),
        "last_error": pipeline_stats["last_error"],
        "last_error_time": pipeline_stats["last_error_time"],
        "error_log": pipeline_stats["error_log"],
    }

    try:
        tmp = STATUS_JSON + ".tmp"
        with open(tmp, "w", encoding="utf-8") as f:
            json.dump(status_dict, f, indent=2)
        os.replace(tmp, STATUS_JSON)
    except Exception:
        pass


# ============================================================
# DÉTECTION RÉSEAU
# ============================================================
def get_connected_ips():
    try:
        out = subprocess.check_output(["ip", "neigh"], text=True)
        ips = []
        for line in out.splitlines():
            if "dev eth0" not in line:
                continue
            ip = line.split()[0]
            if ip.count(".") == 3:
                ips.append(ip)
        return list(dict.fromkeys(ips))
    except Exception:
        return []

def rtsp_works(ip, settings):
    try:
        with socket.create_connection((ip, 554), timeout=settings["rtsp_timeout"]):
            pass
    except Exception:
        return False

    rtsp_url = settings["rtsp_template"].format(ip=ip)
    cap = cv2.VideoCapture(rtsp_url, cv2.CAP_FFMPEG)
    if not cap.isOpened():
        cap.release()
        return False

    ok = False
    for _ in range(5):
        ret, frame = cap.read()
        if ret and frame is not None:
            ok = True
            break
    cap.release()
    return ok

def detect_camera_ip(settings):
    ips = get_connected_ips()
    if not ips:
        return None
    print("[INFO] IPs détectées:", ips)
    for ip in ips:
        print(f"[INFO] Test RTSP sur {ip} ...")
        if rtsp_works(ip, settings):
            print(f"[OK] Caméra détectée sur {ip}")
            return ip
    return None


# ============================================================
# CAPTURE IMAGE
# ============================================================
def capture_one_frame(rtsp_url, settings):
    cap = cv2.VideoCapture(rtsp_url, cv2.CAP_FFMPEG)
    ok = False
    if cap.isOpened():
        for _ in range(settings["warmup_reads"]):
            ret, frame = cap.read()
            if ret and frame is not None:
                ensure_dir(DATA_DIR)
                tmp = IMAGE_PATH + ".tmp.jpg"
                cv2.imwrite(tmp, frame)
                os.replace(tmp, IMAGE_PATH)
                ok = True
                break
    cap.release()
    return ok


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

def parse_coords(path):
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
    if not isinstance(data, list):
        raise ValueError("coords.json doit être une liste de ROIs")
    rois = []
    for i, roi in enumerate(data, start=1):
        pts = np.array(roi, dtype=np.float32)
        if pts.shape == (4, 2):
            rois.append((i, pts))
    if not rois:
        raise ValueError("Aucune ROI valide dans coords.json")
    return rois

def crop_rois(settings):
    ensure_dir(CROPS_DIR)
    img = cv2.imread(IMAGE_PATH)
    if img is None:
        raise RuntimeError("Image latest.jpg introuvable")

    rois = parse_coords(COORDS_JSON)
    w, h = settings["cnn_size"]
    dst = np.array([[0,0],[w-1,0],[w-1,h-1],[0,h-1]], dtype=np.float32)

    saved = 0
    for roi_id, pts in rois:
        pts = order_points(pts)
        M = cv2.getPerspectiveTransform(pts, dst)
        warped = cv2.warpPerspective(img, M, (w, h), flags=cv2.INTER_AREA)
        out_path = os.path.join(CROPS_DIR, f"roi_{roi_id:03d}.png")
        cv2.imwrite(out_path, warped)
        saved += 1
    return saved


# ============================================================
# MAIN LOOP
# ============================================================
def main():
    ensure_dir(DATA_DIR)
    ensure_dir(CROPS_DIR)
    ensure_dir(LOG_DIR)
    ensure_dir(CONFIG_DIR)

    pipeline_stats["start_time"] = time.strftime("%Y-%m-%d %H:%M:%S")
    pipeline_stats["_start_ts"] = time.time()

    print("[INFO] Parking camera pipeline started")

    while True:
        pipeline_stats["total_cycles"] += 1
        reset_daily_counters()

        settings = load_settings()
        print(f"[INFO] Cycle #{pipeline_stats['total_cycles']} — "
              f"interval={settings['interval']}s, cnn_size={settings['cnn_size']}")

        time.sleep(settings["precheck_delay"])
        cycle_start = time.time()

        # ── Détection caméra ──
        cam_ip = detect_camera_ip(settings)

        if cam_ip is None:
            msg = "Aucune caméra RTSP détectée"
            print("[ERROR]", msg)
            write_echec(msg)
            log_error(msg)
            write_status({
                "status": "error",
                "message": msg,
                "camera_ip": None,
                "camera_connected": False,
                "rois": 0,
                "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
                "settings": settings,
            })
            time.sleep(settings["interval"])
            continue

        clear_echec()
        rtsp_url = settings["rtsp_template"].format(ip=cam_ip)

        # ── Capture ──
        if not capture_one_frame(rtsp_url, settings):
            msg = f"Caméra détectée ({cam_ip}) mais capture RTSP échouée"
            print("[WARN]", msg)
            write_echec(msg)
            log_error(msg)
            write_status({
                "status": "warn",
                "message": msg,
                "camera_ip": cam_ip,
                "camera_connected": True,
                "rois": 0,
                "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
                "settings": settings,
            })
            time.sleep(settings["interval"])
            continue

        # ── Découpe ROIs ──
        try:
            n = crop_rois(settings)
            duration = time.time() - cycle_start
            pipeline_stats["last_capture_duration"] = duration
            log_capture_success()
            print(f"[OK] Capture + {n} ROIs (caméra {cam_ip}) en {duration:.1f}s")
            write_status({
                "status": "ok",
                "message": f"{n} ROIs extraites",
                "camera_ip": cam_ip,
                "camera_connected": True,
                "rois": n,
                "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
                "settings": settings,
            })
        except Exception as e:
            msg = f"Erreur découpe ROI: {e}"
            print("[ERROR]", msg)
            write_echec(msg)
            log_error(msg)
            write_status({
                "status": "error",
                "message": msg,
                "camera_ip": cam_ip,
                "camera_connected": True,
                "rois": 0,
                "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
                "settings": settings,
            })

        time.sleep(settings["interval"])


if __name__ == "__main__":
    main()
