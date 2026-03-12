"""
api_server.py — API REST pour le frontend du parking intelligent (PYNQ-Z2)

Endpoints :
  GET  /api/status              → statut du pipeline (status.json)
  GET  /api/settings            → paramètres actuels (settings.json)
  POST /api/settings            → modifier les paramètres
  GET  /api/image/latest        → dernière image capturée (latest.jpg)
  GET  /api/rois                → liste des ROIs disponibles
  GET  /api/rois/<filename>     → image d'une ROI spécifique
  GET  /api/coords              → contenu de coords.json
  POST /api/coords              → mettre à jour coords.json

Lancer : python3 api_server.py
Port par défaut : 5000
"""

import os
import json
import glob
import time
from flask import Flask, jsonify, request, send_file, abort
from flask_cors import CORS

# ============================================================
# CHEMINS
# ============================================================
BASE_DIR      = "/home/xilinx/parking_system"
CONFIG_DIR    = os.path.join(BASE_DIR, "config")
DATA_DIR      = os.path.join(BASE_DIR, "data")

SETTINGS_JSON = os.path.join(CONFIG_DIR, "settings.json")
COORDS_JSON   = os.path.join(CONFIG_DIR, "coords.json")
STATUS_JSON   = os.path.join(DATA_DIR, "status.json")
IMAGE_PATH    = os.path.join(DATA_DIR, "latest.jpg")
CROPS_DIR     = os.path.join(DATA_DIR, "crops")

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
# APP FLASK
# ============================================================
app = Flask(__name__)
CORS(app)  # Permet les appels depuis n'importe quel frontend


def _read_json(path, default=None):
    """Lecture sécurisée d'un fichier JSON."""
    if not os.path.exists(path):
        return default
    try:
        with open(path, "r", encoding="utf-8") as f:
            return json.load(f)
    except Exception:
        return default


def _write_json(path, data):
    """Écriture atomique d'un fichier JSON."""
    os.makedirs(os.path.dirname(path), exist_ok=True)
    tmp = path + ".tmp"
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    os.replace(tmp, path)


# ────────────────────────────────────────────
# STATUS
# ────────────────────────────────────────────
@app.route("/api/status", methods=["GET"])
def get_status():
    """Retourne le statut courant du pipeline."""
    status = _read_json(STATUS_JSON, {
        "status": "unknown",
        "message": "Pas encore de données",
        "timestamp": None,
    })
    return jsonify(status)


# ────────────────────────────────────────────
# SETTINGS (lecture / écriture)
# ────────────────────────────────────────────
@app.route("/api/settings", methods=["GET"])
def get_settings():
    """Retourne les paramètres actuels."""
    settings = _read_json(SETTINGS_JSON, DEFAULT_SETTINGS)
    return jsonify(settings)


@app.route("/api/settings", methods=["POST"])
def update_settings():
    """
    Met à jour settings.json.
    Le frontend envoie un JSON partiel ou complet.
    Seuls les champs valides sont acceptés.
    """
    body = request.get_json(silent=True)
    if not body or not isinstance(body, dict):
        return jsonify({"error": "JSON invalide"}), 400

    # Charger les paramètres existants
    current = _read_json(SETTINGS_JSON, DEFAULT_SETTINGS.copy())

    errors = []

    # ── interval ──
    if "interval" in body:
        val = body["interval"]
        if isinstance(val, (int, float)) and val >= 5:
            current["interval"] = int(val)
        else:
            errors.append("interval doit être un entier >= 5")

    # ── cnn_size ──
    if "cnn_size" in body:
        val = body["cnn_size"]
        if (isinstance(val, list) and len(val) == 2
                and all(isinstance(v, int) and 32 <= v <= 1024 for v in val)):
            current["cnn_size"] = val
        else:
            errors.append("cnn_size doit être [W, H] avec 32 <= W,H <= 1024")

    # ── rtsp_template ──
    if "rtsp_template" in body:
        val = body["rtsp_template"]
        if isinstance(val, str) and "{ip}" in val:
            current["rtsp_template"] = val
        else:
            errors.append("rtsp_template doit contenir {ip}")

    # ── rtsp_timeout ──
    if "rtsp_timeout" in body:
        val = body["rtsp_timeout"]
        if isinstance(val, (int, float)) and val > 0:
            current["rtsp_timeout"] = float(val)
        else:
            errors.append("rtsp_timeout doit être > 0")

    # ── warmup_reads ──
    if "warmup_reads" in body:
        val = body["warmup_reads"]
        if isinstance(val, int) and val >= 1:
            current["warmup_reads"] = val
        else:
            errors.append("warmup_reads doit être un entier >= 1")

    # ── precheck_delay ──
    if "precheck_delay" in body:
        val = body["precheck_delay"]
        if isinstance(val, (int, float)) and val >= 0:
            current["precheck_delay"] = int(val)
        else:
            errors.append("precheck_delay doit être >= 0")

    # Sauvegarder
    _write_json(SETTINGS_JSON, current)

    result = {"saved": current}
    if errors:
        result["warnings"] = errors

    return jsonify(result)


# ────────────────────────────────────────────
# IMAGE LATEST
# ────────────────────────────────────────────
@app.route("/api/image/latest", methods=["GET"])
def get_latest_image():
    """Retourne la dernière image capturée."""
    if not os.path.exists(IMAGE_PATH):
        abort(404, description="Aucune image disponible")
    return send_file(IMAGE_PATH, mimetype="image/jpeg")


# ────────────────────────────────────────────
# ROIs
# ────────────────────────────────────────────
@app.route("/api/rois", methods=["GET"])
def list_rois():
    """Liste toutes les ROIs découpées avec métadonnées."""
    if not os.path.isdir(CROPS_DIR):
        return jsonify({"rois": []})

    files = sorted(glob.glob(os.path.join(CROPS_DIR, "roi_*.png")))
    rois = []
    for f in files:
        name = os.path.basename(f)
        stat = os.stat(f)
        rois.append({
            "filename": name,
            "url": f"/api/rois/{name}",
            "size_bytes": stat.st_size,
            "modified": time.strftime(
                "%Y-%m-%d %H:%M:%S", time.localtime(stat.st_mtime)
            ),
        })

    return jsonify({"rois": rois, "count": len(rois)})


@app.route("/api/rois/<filename>", methods=["GET"])
def get_roi_image(filename):
    """Retourne l'image d'une ROI spécifique."""
    # Sécurité : empêcher path traversal
    if "/" in filename or "\\" in filename or ".." in filename:
        abort(400, description="Nom de fichier invalide")

    path = os.path.join(CROPS_DIR, filename)
    if not os.path.exists(path):
        abort(404, description="ROI non trouvée")

    return send_file(path, mimetype="image/png")


# ────────────────────────────────────────────
# COORDS (lecture / écriture)
# ────────────────────────────────────────────
@app.route("/api/coords", methods=["GET"])
def get_coords():
    """Retourne le contenu de coords.json."""
    data = _read_json(COORDS_JSON, [])
    return jsonify(data)


@app.route("/api/coords", methods=["POST"])
def update_coords():
    """
    Met à jour coords.json.
    Attend une liste de ROIs, chaque ROI = [[x1,y1],[x2,y2],[x3,y3],[x4,y4]]
    """
    body = request.get_json(silent=True)

    if not isinstance(body, list):
        return jsonify({"error": "Attendu: une liste de ROIs"}), 400

    # Validation
    validated = []
    for i, roi in enumerate(body):
        if not isinstance(roi, list) or len(roi) != 4:
            return jsonify({
                "error": f"ROI {i}: doit contenir exactement 4 points"
            }), 400
        for j, pt in enumerate(roi):
            if (not isinstance(pt, list) or len(pt) != 2
                    or not all(isinstance(v, (int, float)) for v in pt)):
                return jsonify({
                    "error": f"ROI {i}, point {j}: doit être [x, y]"
                }), 400
        validated.append(roi)

    _write_json(COORDS_JSON, validated)

    return jsonify({
        "saved": len(validated),
        "message": f"{len(validated)} ROIs enregistrées"
    })


# ────────────────────────────────────────────
# RÉSULTATS FPGA
# ────────────────────────────────────────────
FPGA_RESULTS = os.path.join(DATA_DIR, "fpga_results.json")


@app.route("/api/fpga/results", methods=["GET"])
def get_fpga_results():
    """Retourne les résultats de classification FPGA (toutes les places)."""
    data = _read_json(FPGA_RESULTS, {
        "summary": {"free": 0, "occupied": 0, "total": 0},
        "items": [],
        "mode": "unavailable",
    })
    return jsonify(data)


@app.route("/api/live/stats", methods=["GET"])
def get_live_stats():
    """Retourne le comptage libre/occupé pour le Live View."""
    data = _read_json(FPGA_RESULTS, {})
    summary = data.get("summary", {})
    return jsonify({
        "free": summary.get("free", 0),
        "occ": summary.get("occupied", 0),
        "total": summary.get("total", 0),
    })


# ────────────────────────────────────────────
# INTERFACE WEB (servir le HTML)
# ────────────────────────────────────────────
WEB_DIR = os.path.join(BASE_DIR, "web")


@app.route("/", methods=["GET"])
def serve_index():
    """Page principale — l'interface parking."""
    index_path = os.path.join(WEB_DIR, "parking_interface.html")
    if not os.path.exists(index_path):
        return (
            "<h3>Interface non trouvée</h3>"
            f"<p>Placez <code>parking_interface.html</code> dans "
            f"<code>{WEB_DIR}/</code></p>"
        ), 404
    return send_file(index_path)


# ============================================================
# DÉMARRAGE
# ============================================================
if __name__ == "__main__":
    print("[API] Démarrage du serveur API parking...")
    print(f"[API] Settings : {SETTINGS_JSON}")
    print(f"[API] Data     : {DATA_DIR}")
    print(f"[API] Web      : {WEB_DIR}")

    # Créer les dossiers si absents
    os.makedirs(CONFIG_DIR, exist_ok=True)
    os.makedirs(DATA_DIR, exist_ok=True)

    # Créer settings.json par défaut s'il n'existe pas
    if not os.path.exists(SETTINGS_JSON):
        _write_json(SETTINGS_JSON, DEFAULT_SETTINGS)
        print("[API] settings.json créé avec valeurs par défaut")

    app.run(host="0.0.0.0", port=5000, debug=False)
