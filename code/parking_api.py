#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
parking_api.py — Serveur Flask pour l'IHM du parking

Deux modes :
  - PYNQ  : /home/xilinx/parking_system (détecté automatiquement)
  - PC    : ./parking_system_demo  (créé automatiquement avec données de test)

Lancer : python3 parking_api.py
"""

import os
import sys
import json
import time
import glob
import threading

import cv2
import numpy as np
from flask import Flask, send_file, request, jsonify, Response

# ============================================================
# DÉTECTION DU MODE : PYNQ ou PC
# ============================================================
PYNQ_DIR = "/home/xilinx/parking_system"

if os.path.isdir(PYNQ_DIR):
    BASE_DIR = PYNQ_DIR
    MODE = "pynq"
else:
    # Mode PC : créer un dossier de démo à côté du script
    BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "parking_system_demo")
    BASE_DIR = os.path.abspath(BASE_DIR)
    MODE = "pc"

DATA_DIR     = os.path.join(BASE_DIR, "data")
CROPS_DIR    = os.path.join(DATA_DIR, "crops")
CONFIG_DIR   = os.path.join(BASE_DIR, "config")
CODE_DIR     = os.path.join(BASE_DIR, "code")
COORDS_JSON  = os.path.join(CONFIG_DIR, "coords.json")
SETTINGS_JSON = os.path.join(CONFIG_DIR, "settings.json")
RESULTS_JSON = os.path.join(DATA_DIR, "fpga_results.json")

# L'IHM HTML est toujours à côté du code, dans ../ihm/
SCRIPT_DIR   = os.path.dirname(os.path.abspath(__file__))
IHM_HTML     = os.path.join(SCRIPT_DIR, "..", "ihm", "squelette_parking.html")
IHM_HTML     = os.path.abspath(IHM_HTML)

HOST = "0.0.0.0"
PORT = 5000
ALLOWED_CNN_SIZES = [48, 96, 128, 160, 192, 224]


# ============================================================
# MODE PC : Générer des données de démo
# ============================================================
def setup_demo():
    """Crée un dossier de démo avec une image test et des crops simulés."""
    os.makedirs(DATA_DIR, exist_ok=True)
    os.makedirs(CROPS_DIR, exist_ok=True)
    os.makedirs(CONFIG_DIR, exist_ok=True)
    os.makedirs(CODE_DIR, exist_ok=True)

    # Image de test (parking simulé)
    img_path = os.path.join(DATA_DIR, "latest.jpg")
    if not os.path.isfile(img_path):
        img = np.zeros((720, 1280, 3), dtype=np.uint8)
        img[:] = (40, 35, 30)
        # Dessiner des places de parking
        for i in range(5):
            x1 = 100 + i * 220
            cv2.rectangle(img, (x1, 300), (x1 + 180, 550), (80, 80, 80), 2)
            cv2.putText(img, f"P{i+1}", (x1 + 60, 440),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, (120, 120, 120), 2)
        # Quelques "voitures"
        cv2.rectangle(img, (110, 320), (270, 540), (30, 30, 150), -1)  # P1 occupée
        cv2.rectangle(img, (550, 320), (710, 540), (30, 30, 150), -1)  # P3 occupée
        cv2.putText(img, "PARKING DEMO - MODE PC", (350, 100),
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 200, 255), 2)
        cv2.putText(img, time.strftime("%Y-%m-%d %H:%M:%S"), (450, 680),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.7, (100, 100, 100), 1)
        cv2.imwrite(img_path, img)

    # Coords de démo (3 zones)
    if not os.path.isfile(COORDS_JSON):
        coords = [
            [[100, 300], [280, 300], [280, 550], [100, 550]],
            [[320, 300], [500, 300], [500, 550], [320, 550]],
            [[540, 300], [720, 300], [720, 550], [540, 550]]
        ]
        with open(COORDS_JSON, "w") as f:
            json.dump(coords, f, indent=2)

    # Crops de démo
    for i in range(3):
        crop_path = os.path.join(CROPS_DIR, f"roi_{i+1:03d}.png")
        if not os.path.isfile(crop_path):
            crop = np.zeros((48, 48, 3), dtype=np.uint8)
            if i in [0, 2]:  # occupées
                crop[:] = (30, 30, 150)
            else:  # libre
                crop[:] = (80, 80, 80)
            cv2.imwrite(crop_path, crop)

    # Résultats FPGA de démo
    if not os.path.isfile(RESULTS_JSON):
        results = {
            "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
            "mode": "demo",
            "cnn_size": [48, 48],
            "items": [
                {"roi_file": "roi_001.png", "ok": True, "mode": "demo", "label": "OCCUPIED", "pred": 1},
                {"roi_file": "roi_002.png", "ok": True, "mode": "demo", "label": "FREE", "pred": 0},
                {"roi_file": "roi_003.png", "ok": True, "mode": "demo", "label": "OCCUPIED", "pred": 1}
            ]
        }
        with open(RESULTS_JSON, "w") as f:
            json.dump(results, f, indent=2)

    # Settings de démo
    if not os.path.isfile(SETTINGS_JSON):
        with open(SETTINGS_JSON, "w") as f:
            json.dump({"interval": 30, "cnn_size": 48}, f, indent=2)

    print(f"[DEMO] Données de test créées dans {BASE_DIR}")


# ============================================================
# FLASK APP
# ============================================================
app = Flask(__name__)


# ─── Helpers : lire/écrire settings.json ───
def read_settings():
    """Lit settings.json (partagé avec capture_rtsp.py)."""
    defaults = {"interval": 30, "cnn_size": 48}
    try:
        if os.path.isfile(SETTINGS_JSON):
            with open(SETTINGS_JSON, "r") as f:
                s = json.load(f)
            defaults.update(s)
    except Exception:
        pass
    return defaults


def write_settings(new_values):
    """Met à jour settings.json (merge avec existant)."""
    current = read_settings()
    current.update(new_values)
    os.makedirs(CONFIG_DIR, exist_ok=True)
    tmp = SETTINGS_JSON + ".tmp"
    with open(tmp, "w") as f:
        json.dump(current, f, indent=2)
    os.replace(tmp, SETTINGS_JSON)
    return current


# ─── Page principale ───
@app.route("/")
def index():
    return send_file(IHM_HTML)


# ─── API : Images ───
@app.route("/api/images")
def api_images():
    images = []
    for ext in ("*.jpg", "*.jpeg", "*.png"):
        images.extend(glob.glob(os.path.join(DATA_DIR, ext)))
    names = sorted(set(os.path.basename(p) for p in images))
    return jsonify(names)


@app.route("/api/image/<name>")
def api_image(name):
    path = os.path.join(DATA_DIR, name)
    if not os.path.isfile(path):
        return jsonify({"error": "Image non trouvée"}), 404
    return send_file(path, max_age=0)


# ─── API : Coords ───
@app.route("/api/coords")
def api_coords_get():
    if not os.path.isfile(COORDS_JSON):
        return jsonify([])
    try:
        with open(COORDS_JSON, "r") as f:
            return jsonify(json.load(f))
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/api/coords/save", methods=["POST"])
def api_coords_save():
    try:
        body = request.get_json(force=True)
        coords = body.get("coords", [])
        if not isinstance(coords, list):
            return jsonify({"success": False, "error": "coords doit être une liste"}), 400
        os.makedirs(CONFIG_DIR, exist_ok=True)
        tmp = COORDS_JSON + ".tmp"
        with open(tmp, "w") as f:
            json.dump(coords, f, indent=2)
        os.replace(tmp, COORDS_JSON)
        return jsonify({"success": True, "count": len(coords)})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500


# ─── API : Stats temps réel ───
@app.route("/api/live/stats")
def api_live_stats():
    if not os.path.isfile(RESULTS_JSON):
        return jsonify({"free": 0, "occ": 0, "total": 0})
    try:
        with open(RESULTS_JSON, "r") as f:
            data = json.load(f)
        items = data.get("items", [])
        free = sum(1 for it in items if it.get("label", "").upper() == "FREE")
        occ  = sum(1 for it in items if it.get("label", "").upper() == "OCCUPIED")
        return jsonify({
            "free": free, "occ": occ, "total": free + occ,
            "timestamp": data.get("timestamp", ""),
            "mode": data.get("mode", "unknown")
        })
    except Exception as e:
        return jsonify({"free": 0, "occ": 0, "total": 0, "error": str(e)})


# ─── LIVE : Flux MJPEG ───
live_running = False
live_cap = None
live_lock = threading.Lock()
live_source = ""  # description de la source pour l'IHM

# Templates RTSP (même que capture_rtsp.py)
RTSP_TEMPLATES = [
    "rtsp://admin:TPRESEAU!@{ip}:554/h264Preview_01_main",
    "rtsp://{ip}:8554/live",
    "rtsp://{ip}:8554/stream",
    "rtsp://{ip}:554/stream",
]
RTSP_PORTS_LIVE = [554, 8554]


def find_demo_video():
    """Cherche un fichier .mp4/.avi dans data/ pour le mode PC."""
    for ext in ("*.mp4", "*.avi", "*.mkv"):
        vids = glob.glob(os.path.join(DATA_DIR, ext))
        if vids:
            return vids[0]
    return None


def detect_rtsp_source():
    """
    Scanne le réseau (ARP) pour trouver une source RTSP.
    Retourne l'URL RTSP ou None.
    """
    import subprocess
    import socket

    # Lire la table ARP
    try:
        out = subprocess.check_output(["ip", "neigh"], text=True)
        ips = []
        for line in out.splitlines():
            if "dev eth0" not in line:
                continue
            ip = line.split()[0]
            if ip.count(".") == 3:
                ips.append(ip)
        ips = list(dict.fromkeys(ips))
    except Exception:
        return None

    if not ips:
        return None

    print(f"[LIVE] IPs détectées : {ips}")

    for ip in ips:
        # Tester les ports ouverts
        open_ports = []
        for port in RTSP_PORTS_LIVE:
            try:
                with socket.create_connection((ip, port), timeout=0.5):
                    open_ports.append(port)
            except Exception:
                pass

        if not open_ports:
            continue

        # Tester les URLs RTSP
        for template in RTSP_TEMPLATES:
            rtsp_url = template.format(ip=ip)
            try:
                port_in_url = int(rtsp_url.split(":")[2].split("/")[0].split("@")[-1])
            except Exception:
                port_in_url = 554
            if port_in_url not in open_ports:
                continue

            try:
                cap = cv2.VideoCapture(rtsp_url, cv2.CAP_FFMPEG)
                if cap.isOpened():
                    ret, frame = cap.read()
                    if ret and frame is not None:
                        print(f"[LIVE] Source RTSP trouvée : {rtsp_url}")
                        cap.release()
                        return rtsp_url
                cap.release()
            except Exception:
                pass

    return None


@app.route("/api/live/start", methods=["POST"])
def api_live_start():
    global live_running, live_cap, live_source
    live_running = True

    # Accepter une URL RTSP manuelle en paramètre
    body = {}
    try:
        body = request.get_json(force=True) or {}
    except Exception:
        pass
    manual_url = body.get("rtsp_url", "")

    with live_lock:
        if live_cap is not None:
            live_cap.release()
            live_cap = None

        source_url = None

        if manual_url:
            # URL RTSP fournie manuellement
            source_url = manual_url
            live_source = f"RTSP (manuel) : {manual_url}"

        elif MODE == "pynq":
            # Sur PYNQ : détecter la source RTSP automatiquement
            rtsp_url = detect_rtsp_source()
            if rtsp_url:
                source_url = rtsp_url
                live_source = f"RTSP : {rtsp_url}"
            else:
                live_source = "Image statique (latest.jpg)"

        else:
            # Sur PC : chercher un fichier vidéo .mp4
            video_path = find_demo_video()
            if video_path:
                source_url = video_path
                live_source = f"Vidéo : {os.path.basename(video_path)}"
            else:
                live_source = "Image statique (latest.jpg)"

        # Ouvrir la source vidéo/RTSP
        if source_url:
            live_cap = cv2.VideoCapture(source_url, cv2.CAP_FFMPEG)
            if not live_cap.isOpened():
                live_cap = None
                live_source = f"ERREUR : impossible d'ouvrir {source_url}"
                print(f"[LIVE] {live_source}")
                return jsonify({"ok": False, "error": live_source, "source": live_source})

    print(f"[LIVE] Démarré — {live_source}")
    return jsonify({"ok": True, "source": live_source})


@app.route("/api/live/stop", methods=["POST"])
def api_live_stop():
    global live_running, live_cap, live_source
    live_running = False
    with live_lock:
        if live_cap is not None:
            live_cap.release()
            live_cap = None
    live_source = ""
    return jsonify({"ok": True})


@app.route("/api/live/source")
def api_live_source():
    """Retourne la source live actuelle."""
    return jsonify({"running": live_running, "source": live_source})


def gen_mjpeg():
    global live_running, live_cap

    while live_running:
        frame = None

        with live_lock:
            if live_cap is not None and live_cap.isOpened():
                ret, frame = live_cap.read()
                if not ret:
                    # Boucler (vidéo fichier) ou reconnecter (RTSP)
                    live_cap.set(cv2.CAP_PROP_POS_FRAMES, 0)
                    ret, frame = live_cap.read()
                    if not ret:
                        frame = None

        # Fallback : lire latest.jpg
        if frame is None:
            img_path = os.path.join(DATA_DIR, "latest.jpg")
            if os.path.isfile(img_path):
                frame = cv2.imread(img_path)

        if frame is not None:
            try:
                frame = draw_results_on_frame(frame)
                _, buf = cv2.imencode(".jpg", frame, [cv2.IMWRITE_JPEG_QUALITY, 80])
                yield (b"--frame\r\nContent-Type: image/jpeg\r\n\r\n" + buf.tobytes() + b"\r\n")
            except Exception:
                pass

        # ~25 fps pour vidéo/RTSP, 1 fps pour image statique
        with live_lock:
            is_video = live_cap is not None and live_cap.isOpened()
        if is_video:
            time.sleep(0.04)
        else:
            time.sleep(1.0)


def draw_results_on_frame(frame):
    coords = []
    if os.path.isfile(COORDS_JSON):
        try:
            with open(COORDS_JSON, "r") as f:
                coords = json.load(f)
        except Exception:
            pass

    results = {}
    if os.path.isfile(RESULTS_JSON):
        try:
            with open(RESULTS_JSON, "r") as f:
                data = json.load(f)
            for item in data.get("items", []):
                results[item.get("roi_file", "")] = item
        except Exception:
            pass

    for i, pts in enumerate(coords):
        roi_file = f"roi_{i+1:03d}.png"
        item = results.get(roi_file, {})
        label = item.get("label", "?").upper()
        color = (0, 255, 100) if label == "FREE" else (0, 50, 255) if label == "OCCUPIED" else (255, 200, 0)
        poly = np.array(pts, dtype=np.int32)
        cv2.polylines(frame, [poly], True, color, 2)
        overlay = frame.copy()
        cv2.fillPoly(overlay, [poly], color)
        cv2.addWeighted(overlay, 0.2, frame, 0.8, 0, frame)
        cx = int(np.mean([p[0] for p in pts]))
        cy = int(np.mean([p[1] for p in pts]))
        text = f"P{i+1}: {label}"
        (tw, th), _ = cv2.getTextSize(text, cv2.FONT_HERSHEY_SIMPLEX, 0.6, 2)
        cv2.rectangle(frame, (cx - tw // 2 - 4, cy - th - 4), (cx + tw // 2 + 4, cy + 4), (0, 0, 0), -1)
        cv2.putText(frame, text, (cx - tw // 2, cy), cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 2)
    return frame


@app.route("/video_feed")
def video_feed():
    return Response(gen_mjpeg(), mimetype="multipart/x-mixed-replace; boundary=frame")


# ─── API : Crops ───
@app.route("/api/crop/<name>")
def api_crop(name):
    path = os.path.join(CROPS_DIR, name)
    if not os.path.isfile(path):
        return jsonify({"error": "Crop non trouvé"}), 404
    return send_file(path, max_age=0)


@app.route("/api/crops")
def api_crops():
    crops = []
    for ext in ("*.png", "*.jpg", "*.jpeg"):
        for p in glob.glob(os.path.join(CROPS_DIR, ext)):
            try:
                st = os.stat(p)
                crops.append({
                    "name": os.path.basename(p),
                    "size": st.st_size,
                    "mtime": st.st_mtime,
                    "mtime_str": time.strftime("%H:%M:%S", time.localtime(st.st_mtime))
                })
            except Exception:
                pass
    crops.sort(key=lambda c: c["name"])
    return jsonify(crops)


# ─── API : Monitoring snapshot ───
@app.route("/api/monitoring")
def api_monitoring():
    result = {"image": None, "crops": [], "fpga_results": None, "config": {}}

    img_path = os.path.join(DATA_DIR, "latest.jpg")
    if os.path.isfile(img_path):
        st = os.stat(img_path)
        result["image"] = {
            "name": "latest.jpg",
            "mtime": st.st_mtime,
            "mtime_str": time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(st.st_mtime)),
            "size": st.st_size
        }

    for ext in ("*.png", "*.jpg"):
        for p in sorted(glob.glob(os.path.join(CROPS_DIR, ext))):
            try:
                st = os.stat(p)
                result["crops"].append({
                    "name": os.path.basename(p),
                    "mtime": st.st_mtime,
                    "mtime_str": time.strftime("%H:%M:%S", time.localtime(st.st_mtime))
                })
            except Exception:
                pass

    if os.path.isfile(RESULTS_JSON):
        try:
            with open(RESULTS_JSON, "r") as f:
                result["fpga_results"] = json.load(f)
        except Exception:
            pass

    result["config"] = _read_current_config()
    return jsonify(result)


# ─── API : Config ───
def _read_current_config():
    s = read_settings()
    s["allowed_cnn_sizes"] = ALLOWED_CNN_SIZES
    return s


@app.route("/api/config")
def api_config_get():
    return jsonify(_read_current_config())


@app.route("/api/config", methods=["POST"])
def api_config_set():
    try:
        body = request.get_json(force=True)
        updates = {}
        changes = []

        if "interval" in body:
            v = int(body["interval"])
            if v < 5 or v > 3600:
                return jsonify({"success": False, "error": "Interval: 5-3600 sec"}), 400
            updates["interval"] = v
            changes.append(f"interval={v}s")

        if "cnn_size" in body:
            v = int(body["cnn_size"])
            if v not in ALLOWED_CNN_SIZES:
                return jsonify({"success": False, "error": f"Tailles: {ALLOWED_CNN_SIZES}"}), 400
            updates["cnn_size"] = v
            changes.append(f"cnn_size={v}x{v}")

        if updates:
            write_settings(updates)
            return jsonify({"success": True, "changes": changes,
                            "message": "Config appliquée ! Prise en compte au prochain cycle de capture."})
        return jsonify({"success": False, "error": "Aucun paramètre modifié"})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500


# ============================================================
# MAIN
# ============================================================
if __name__ == "__main__":
    if MODE == "pc":
        setup_demo()

    print("=" * 56)
    print("  SMART PARKING — Serveur IHM Flask")
    print(f"  Mode    : {'PYNQ-Z2' if MODE == 'pynq' else 'PC (démo)'}")
    print("=" * 56)
    print(f"  Interface : http://localhost:{PORT}/")
    print(f"  HTML      : {IHM_HTML}")
    print(f"  Data      : {DATA_DIR}")
    print(f"  Config    : {COORDS_JSON}")
    print("=" * 56)

    app.run(host=HOST, port=PORT, debug=False, threaded=True)
