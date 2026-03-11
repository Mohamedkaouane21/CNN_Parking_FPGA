"""
Parking Vision Setup Server
============================
- Éditeur de places (polygones)
- Live View RTSP avec YOLO + masque
- Démo vidéo avec YOLO + masque

Usage:
    python3 parking_setup_server_v2.py
    Ouvrir http://<IP_RPI>:5000 depuis un PC sur le même réseau.
"""

from flask import Flask, request, jsonify, send_file, Response, render_template
import json, os, glob, threading, time, re, shutil
import cv2
import numpy as np
from collections import deque

# ── PATHS ──────────────────────────────────────────────
APP_DIR     = os.path.dirname(os.path.abspath(__file__))
UI_DIR      = os.path.join(APP_DIR, 'parking_ui')
DATA_DIR    = os.path.join(APP_DIR, 'data')
CAPTURES_DIR= os.path.join(APP_DIR, 'captures')
MODELS_DIR  = os.path.join(APP_DIR, 'models')
VIDEOS_DIR  = os.path.join(APP_DIR, 'videos')
COORDS_DIR  = os.path.join(DATA_DIR, 'coords')
SENSORS_DIR = os.path.join(DATA_DIR, 'sensors')

# Créer l'arborescence automatiquement
for d in [DATA_DIR, CAPTURES_DIR, MODELS_DIR, VIDEOS_DIR, COORDS_DIR, SENSORS_DIR]:
    os.makedirs(d, exist_ok=True)

app = Flask(__name__,
            template_folder=os.path.join(UI_DIR, 'templates'),
            static_folder=os.path.join(UI_DIR, 'static'))

CAMERAS_FILE  = os.path.join(DATA_DIR, "cameras.json")
SETTINGS_FILE = os.path.join(DATA_DIR, "settings.json")

# ── CONFIG ──────────────────────────────────────────────
YOLO_MODEL     = "yolov8s_visdrone_320.onnx"
INPUT_SIZE     = 320
VISDRONE_IDS   = {3, 4, 5, 8, 9}   # classes véhicules VisDrone

_VISDRONE_LIST = np.array(list(VISDRONE_IDS))

# Valeurs par défaut (utilisées si settings.json n'existe pas)
DEFAULT_SETTINGS = {
    "conf_threshold": 0.25,
    "nms_threshold":  0.45,
    "vote_window":    15,
    "vote_threshold": 0.6,
    "process_every":  6,
    "stream_fps":     12,
    "jpeg_quality":   80,
    "detect_point":   85,
    "detect_horizontal": 50,
    "yolo_enabled":   True,
    "mask_enabled":   True,
    "xbee_enabled":   False,
    "xbee_port":      "auto",
    "xbee_baud":      115200,
    "xbee_interval":  30,
    "default_camera": "",
}


def load_settings():
    """Charge les réglages depuis settings.json, crée le fichier si absent."""
    if os.path.exists(SETTINGS_FILE):
        with open(SETTINGS_FILE) as f:
            saved = json.load(f)
        # Fusionner avec les valeurs par défaut (au cas où de nouveaux champs sont ajoutés)
        merged = {**DEFAULT_SETTINGS, **saved}
        return merged
    save_settings(DEFAULT_SETTINGS)
    return dict(DEFAULT_SETTINGS)

def save_settings(settings):
    """Sauvegarde les réglages dans settings.json."""
    with open(SETTINGS_FILE, "w") as f:
        json.dump(settings, f, indent=2)

# Charger les réglages au démarrage
SETTINGS = load_settings()


# ══════════════════════════════════════════
# GESTION CAMÉRAS
# ══════════════════════════════════════════

def load_cameras():
    """Charge la liste des caméras depuis cameras.json."""
    if os.path.exists(CAMERAS_FILE):
        with open(CAMERAS_FILE) as f:
            return json.load(f)
    default = [{
        "id": "cam1",
        "name": "Caméra 1",
        "ip": "192.168.0.6",
        "port": "554",
        "path": "h264Preview_01_sub",
        "user": "admin",
        "pass": "TPRESEAU!",
        "zone": "A"
    }]
    save_cameras(default)
    return default

def save_cameras(cameras):
    """Sauvegarde la liste des caméras."""
    with open(CAMERAS_FILE, "w") as f:
        json.dump(cameras, f, indent=2)

def camera_rtsp_url(cam):
    """Construit l'URL RTSP depuis un objet caméra."""
    return f"rtsp://{cam['user']}:{cam['pass']}@{cam['ip']}:{cam['port']}/{cam['path']}"


# ══════════════════════════════════════════
# YOLO DETECTOR
# ══════════════════════════════════════════

class YOLODetector:
    _net      = None
    _ready    = False
    _failed   = False
    _lock     = threading.Lock()

    @classmethod
    def get(cls):
        """Charge le modèle (une seule fois). Retourne True si prêt."""
        with cls._lock:
            if cls._ready:
                return True
            if cls._failed:
                return False

            model_path = os.path.join(MODELS_DIR, YOLO_MODEL)
            if not os.path.exists(model_path):
                print(f"[YOLO] Modèle introuvable : {YOLO_MODEL}", flush=True)
                cls._failed = True
                return False

            try:
                net = cv2.dnn.readNetFromONNX(model_path)
                net.setPreferableBackend(cv2.dnn.DNN_BACKEND_OPENCV)
                net.setPreferableTarget(cv2.dnn.DNN_TARGET_CPU)
                cv2.setNumThreads(os.cpu_count() or 4)
                cls._net = net
                cls._ready = True
                print(f"[YOLO] {YOLO_MODEL} chargé ({os.cpu_count()} threads)", flush=True)
                return True
            except Exception as e:
                print(f"[YOLO] ERREUR chargement : {e}", flush=True)
                cls._failed = True
                return False

    _detect_count = 0
    _detect_total = 0.0

    @classmethod
    def detect(cls, frame):
        if not cls.get():
            return []

        t0 = time.time()

        H, W = frame.shape[:2]

        # Inférence
        blob = cv2.dnn.blobFromImage(frame, 1/255.0, (INPUT_SIZE, INPUT_SIZE),
                                      swapRB=True, crop=False)
        cls._net.setInput(blob)
        out = cls._net.forward()[0].transpose()

        # Post-traitement vectorisé
        scores_all = out[:, 4:]
        class_ids = np.argmax(scores_all, axis=1)
        confidences = scores_all[np.arange(len(scores_all)), class_ids]

        mask = (confidences >= SETTINGS['conf_threshold']) & np.isin(class_ids, _VISDRONE_LIST)
        if not np.any(mask):
            cls._log_perf(time.time() - t0, 0)
            return []

        out_f = out[mask]
        confs_f = confidences[mask].tolist()

        scale_x, scale_y = W / INPUT_SIZE, H / INPUT_SIZE
        cx, cy, bw, bh = out_f[:, 0], out_f[:, 1], out_f[:, 2], out_f[:, 3]
        x = ((cx - bw / 2) * scale_x).astype(int)
        y = ((cy - bh / 2) * scale_y).astype(int)
        w = (bw * scale_x).astype(int)
        h = (bh * scale_y).astype(int)
        boxes = np.stack([x, y, w, h], axis=1).tolist()

        idxs = cv2.dnn.NMSBoxes(boxes, confs_f, SETTINGS['conf_threshold'], SETTINGS['nms_threshold'])
        if len(idxs) == 0:
            cls._log_perf(time.time() - t0, 0)
            return []

        result = [boxes[i] for i in idxs.flatten()]
        cls._log_perf(time.time() - t0, len(result))
        return result

    @classmethod
    def _log_perf(cls, elapsed, n_vehicles):
        cls._detect_count += 1
        cls._detect_total += elapsed
        if cls._detect_count % 10 == 0:
            avg = cls._detect_total / cls._detect_count * 1000
            print(f"[YOLO] moyenne : {avg:.0f}ms ({cls._detect_count} appels, {n_vehicles} véhicules)", flush=True)


# ══════════════════════════════════════════
# XBEE / LORA SENDER
# ══════════════════════════════════════════

try:
    import serial
    _HAS_SERIAL = True
except ImportError:
    _HAS_SERIAL = False


class XBeeSender:
    def __init__(self):
        self._serial = None
        self._thread = None
        self._running = False
        self._last_data = {}

    @staticmethod
    def _auto_detect():
        """Détecte automatiquement le port et baud rate du XBee."""
        import glob as _glob
        ports = sorted(_glob.glob('/dev/ttyUSB*') + _glob.glob('/dev/ttyACM*'))
        if not ports:
            print("[XBEE] Aucun port série détecté", flush=True)
            return None, None
        bauds = [115200, 9600, 57600, 38400, 19200]
        for port in ports:
            for baud in bauds:
                try:
                    ser = serial.Serial(port, baud, timeout=1.5)
                    time.sleep(1)
                    # Vider le buffer
                    ser.reset_input_buffer()
                    # Envoyer un test simple : écrire et vérifier que ça ne plante pas
                    ser.write(b'+++')
                    time.sleep(1.2)
                    resp = ser.read(ser.in_waiting or 1)
                    ser.close()
                    if b'OK' in resp:
                        print(f"[XBEE] Auto-détecté : {port} @ {baud} (mode AT confirmé)", flush=True)
                        return port, baud
                    else:
                        # Pas de réponse AT mais le port s'ouvre → probable XBee en mode transparent
                        print(f"[XBEE] Port {port} @ {baud} ouvert (pas de réponse AT, mode transparent probable)", flush=True)
                        return port, baud
                except Exception:
                    continue
        print("[XBEE] Aucun XBee trouvé sur les ports disponibles", flush=True)
        return None, None

    def start(self):
        if not _HAS_SERIAL:
            print("[XBEE] pyserial non installé (pip install pyserial)", flush=True)
            return
        if not SETTINGS.get('xbee_enabled'):
            return
        if self._running:
            return
        port = SETTINGS.get('xbee_port', 'auto')
        baud = SETTINGS.get('xbee_baud', 115200)

        # Auto-détection si port = "auto" ou si le port configuré n'existe pas
        if port == 'auto' or not os.path.exists(port):
            print(f"[XBEE] Auto-détection en cours...", flush=True)
            det_port, det_baud = self._auto_detect()
            if det_port:
                port = det_port
                baud = det_baud
                # Sauvegarder le port détecté
                SETTINGS['xbee_port'] = port
                SETTINGS['xbee_baud'] = baud
                save_settings(SETTINGS)
            else:
                print("[XBEE] Auto-détection échouée", flush=True)
                return

        try:
            self._serial = serial.Serial(port, baud, timeout=1)
            time.sleep(2)  # laisser le port se stabiliser
            self._running = True
            self._thread = threading.Thread(target=self._loop, daemon=True)
            self._thread.start()
            print(f"[XBEE] Démarré sur {port} @ {baud} baud", flush=True)
        except Exception as e:
            print(f"[XBEE] Erreur ouverture {port} : {e}", flush=True)
            self._serial = None

    def stop(self):
        self._running = False
        if self._thread and self._thread.is_alive():
            self._thread.join(timeout=3)
        if self._serial:
            try:
                self._serial.close()
            except:
                pass
            self._serial = None
        print("[XBEE] Arrêté", flush=True)

    def _loop(self):
        while self._running:
            interval = SETTINGS.get('xbee_interval', 30)
            time.sleep(interval)
            if not self._running:
                break
            self._send()

    def _send(self):
        if not self._serial or not self._serial.is_open:
            return
        stats = engine.stats
        zone = getattr(self, '_zone_cache', 'Z')
        # Rafraîchir le cache zone toutes les 10 envois
        if not hasattr(self, '_send_count'):
            self._send_count = 0
        if self._send_count % 10 == 0 and engine.cam_id:
            try:
                cams = load_cameras()
                cam = next((c for c in cams if c["id"] == engine.cam_id), None)
                if cam:
                    self._zone_cache = cam.get("zone", "Z")
                    zone = self._zone_cache
            except:
                pass
        self._send_count += 1
        if stats.get("error") or not engine.running:
            free = -1
            total = -1
        else:
            free = stats.get("free", 0)
            total = stats.get("total", 0)
        msg = f'{{"zone":"{zone}","nb_places_libres":{free},"nb_places_total":{total},"device":"camera"}}\n'
        try:
            self._serial.write(msg.encode('utf-8'))
            self._last_data = {"zone": zone, "nb_places_libres": free, "nb_places_total": total}
            print(f"[XBEE] Envoyé : {msg.strip()}", flush=True)
        except Exception as e:
            print(f"[XBEE] Erreur envoi : {e}", flush=True)

xbee = XBeeSender()


# ══════════════════════════════════════════
# UTILITAIRES
# ══════════════════════════════════════════

def _normalize_coords(raw):
    """Extrait les tableaux de points depuis le format coords (ancien = liste de pts, nouveau = objet {pts, type})."""
    result = []
    for item in raw:
        if isinstance(item, dict) and "pts" in item:
            result.append(item["pts"])
        else:
            result.append(item)
    return result


def load_coords(W, H, cam_id=None):
    """Charge le fichier de coordonnées correspondant au masque actif de la caméra."""
    # Chercher le masque actif dans la config de la caméra
    if cam_id:
        cameras = load_cameras()
        cam = next((c for c in cameras if c["id"] == cam_id), None)
        if cam and cam.get("active_mask"):
            jf = coords_filename(cam_id, cam["active_mask"])
            path = os.path.join(COORDS_DIR, jf)
            if os.path.exists(path):
                with open(path) as f:
                    return _normalize_coords(json.load(f)), path

    # Fallback : chercher par cam_id + résolution (ancien format)
    search = []
    if cam_id:
        search.append(os.path.join(COORDS_DIR, f"parking_coords_{cam_id}_{W}x{H}.json"))
    search.append(os.path.join(COORDS_DIR, f"parking_coords_{W}x{H}.json"))
    search.append(os.path.join(COORDS_DIR, "parking_coords.json"))
    for fname in search:
        if os.path.exists(fname):
            with open(fname) as f:
                return _normalize_coords(json.load(f)), fname
    return [], None

def precompute_polys(coords):
    """Précalcule les np.array et centres — fait une seule fois au chargement."""
    polys   = [np.array(c, dtype=np.int32) for c in coords]
    centers = [(int(np.mean([p[0] for p in c])), int(np.mean([p[1] for p in c]))) for c in coords]
    return polys, centers


def load_sensor_flags(cam_id=None):
    """Charge la liste des places capteur. Retourne une liste de bool."""
    # Chercher le masque actif pour déterminer le bon fichier
    if cam_id:
        cameras = load_cameras()
        cam = next((c for c in cameras if c["id"] == cam_id), None)
        if cam and cam.get("active_mask"):
            base = re.sub(r'[^a-zA-Z0-9_-]', '_', os.path.splitext(cam["active_mask"])[0]).strip('_')
            fname = os.path.join(SENSORS_DIR, f"sensor_places_{cam_id}_{base}.json")
            if os.path.exists(fname):
                with open(fname) as f:
                    return json.load(f)
    # Fallback
    if cam_id:
        fname = os.path.join(SENSORS_DIR, f"sensor_places_{cam_id}.json")
        if os.path.exists(fname):
            with open(fname) as f:
                return json.load(f)
    fallback = os.path.join(SENSORS_DIR, "sensor_places.json")
    if os.path.exists(fallback):
        with open(fallback) as f:
            return json.load(f)
    return []


def save_sensor_flags(flags, cam_id=None, image_name=None):
    """Sauvegarde la liste des places capteur."""
    if cam_id and image_name:
        base = re.sub(r'[^a-zA-Z0-9_-]', '_', os.path.splitext(image_name)[0]).strip('_')
        fname = os.path.join(SENSORS_DIR, f"sensor_places_{cam_id}_{base}.json")
    elif cam_id:
        fname = os.path.join(SENSORS_DIR, f"sensor_places_{cam_id}.json")
    else:
        fname = os.path.join(SENSORS_DIR, "sensor_places.json")
    with open(fname, "w") as f:
        json.dump(flags, f)

def draw_overlay(frame, polys, centers, states, vehicles, detect_point=85, detect_horizontal=50, sensor_flags=None, show_crosshair=True):
    """Dessine masque + vehicules. Retourne (free, occ)."""
    if sensor_flags is None:
        sensor_flags = []

    for (x, y, w, h) in vehicles:
        cx = x + w//2
        cy = y + h//2
        det_x = x + w * detect_horizontal // 100
        det_y = y + h * detect_point // 100
        if show_crosshair:
            cv2.line(frame, (cx-4, cy), (cx+4, cy), (255,255,0), 2)
            cv2.line(frame, (cx, cy-4), (cx, cy+4), (255,255,0), 2)
            cv2.line(frame, (cx, cy), (det_x, det_y), (0,255,255), 1)
        cv2.circle(frame, (det_x, det_y), 4, (0,255,255), -1)

    free = occ = 0
    if polys:
        overlay = frame.copy()
        for i, pts in enumerate(polys):
            is_sensor = i < len(sensor_flags) and sensor_flags[i]
            if is_sensor:
                cv2.fillPoly(overlay, [pts], (120, 120, 120))  # gris
            else:
                cv2.fillPoly(overlay, [pts], (0,200,80) if states[i] else (0,60,220))
        cv2.addWeighted(overlay, 0.25, frame, 0.75, 0, frame)
        for i, pts in enumerate(polys):
            is_sensor = i < len(sensor_flags) and sensor_flags[i]
            if is_sensor:
                cv2.polylines(frame, [pts], True, (160,160,160), 2)
                cx2, cy2 = centers[i]
                cv2.putText(frame, "S", (cx2-6, cy2+5), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0,0,0), 3)
                cv2.putText(frame, "S", (cx2-6, cy2+5), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (200,200,200), 1)
            else:
                cv2.polylines(frame, [pts], True, (0,255,0) if states[i] else (0,0,255), 2)
                cx2, cy2 = centers[i]
                cv2.putText(frame, str(i+1), (cx2-6, cy2+5), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0,0,0), 3)
                cv2.putText(frame, str(i+1), (cx2-6, cy2+5), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255,255,255), 1)
                if states[i]: free += 1
                else:         occ  += 1

    return free, occ

def draw_hud(frame, free, occ, total, extra_text=""):
    """Affiche le comptage en haut à gauche."""
    label = f"LIBRES:{free}  OCC:{occ}  TOT:{total}"
    if extra_text:
        label += f"  {extra_text}"
    # Largeur auto selon le texte
    (tw, th), _ = cv2.getTextSize(label, cv2.FONT_HERSHEY_SIMPLEX, 0.58, 1)
    box_w = tw + 20
    cv2.rectangle(frame, (10,10), (10 + box_w, 54), (0,0,0), -1)
    cv2.rectangle(frame, (10,10), (10 + box_w, 54), (40,40,40), 1)
    cv2.putText(frame, label, (18,38), cv2.FONT_HERSHEY_SIMPLEX, 0.58, (0,229,255), 1)

def _ascii_safe(text):
    """Remplace les accents par leurs équivalents ASCII pour cv2.putText (police Hershey)."""
    _MAP = str.maketrans('àâäéèêëïîôùûüçÀÂÄÉÈÊËÏÎÔÙÛÜÇ—', 'aaaeeeeiiouuucAAAEEEEIIOUUUC-')
    return text.translate(_MAP)


def draw_centered_text(frame, text, color=(60,60,60), scale=0.7, thickness=2):
    """Dessine un texte centré sur une frame (gère les accents)."""
    H, W = frame.shape[:2]
    safe = _ascii_safe(text)
    (tw, th), _ = cv2.getTextSize(safe, cv2.FONT_HERSHEY_SIMPLEX, scale, thickness)
    x = (W - tw) // 2
    y = (H + th) // 2
    cv2.putText(frame, safe, (x, y), cv2.FONT_HERSHEY_SIMPLEX, scale, color, thickness)


def update_votes(polys, vehicles, votes, states, detect_point=85, detect_horizontal=50, sensor_flags=None):
    """Met à jour les votes de détection pour chaque place."""
    if sensor_flags is None:
        sensor_flags = []
    for i, pts in enumerate(polys):
        # Ignorer les places gérées par capteur
        if i < len(sensor_flags) and sensor_flags[i]:
            continue
        detected = any(
            cv2.pointPolygonTest(pts, (x + w*detect_horizontal//100, y + h*detect_point//100), False) >= 0
            for (x, y, w, h) in vehicles
        )
        votes[i].append(1 if detected else 0)
        if len(votes[i]) == votes[i].maxlen:
            states[i] = (sum(votes[i]) / len(votes[i])) < SETTINGS['vote_threshold']


# ══════════════════════════════════════════
# LIVE ENGINE
# ══════════════════════════════════════════

class LiveEngine:
    def __init__(self):
        self.running      = False
        self.streaming    = False
        self.cam_id       = None  # True quand un client regarde le flux
        self.yolo_enabled = SETTINGS['yolo_enabled']
        self.mask_enabled = SETTINGS['mask_enabled']
        self.detect_point      = SETTINGS['detect_point']
        self.detect_horizontal = SETTINGS['detect_horizontal']
        self.vote_window       = SETTINGS['vote_window']
        self.thread       = None
        self.lock         = threading.Lock()
        self._annotated   = None
        self.frame_event  = threading.Event()
        self.stats        = {"free": 0, "occ": 0, "total": 0, "error": False,
                             "yolo_available": False, "yolo_enabled": self.yolo_enabled}

    def start(self, source=None, cam_id=None):
        if self.running:
            self.stop()
        self.running = True
        self.source  = source
        if not self.source:
            cameras = load_cameras()
            if cameras:
                self.source = camera_rtsp_url(cameras[0])
        self.cam_id  = cam_id
        self.thread  = threading.Thread(target=self._loop, daemon=True)
        self.thread.start()

    def stop(self):
        self.streaming = False
        self.running = False
        if self.thread and self.thread.is_alive():
            self.thread.join(timeout=5)
        self._annotated = None
        self.stats = {"free": 0, "occ": 0, "total": 0, "error": False,
                      "yolo_available": False, "yolo_enabled": self.yolo_enabled}

    def get_jpeg(self):
        with self.lock:
            return self._annotated

    def _loop(self):
        RECONNECT_DELAY = 3  # secondes entre tentatives

        while self.running:
            print(f"[LIVE] Connexion : {self.source}")

            cap = cv2.VideoCapture(self.source)
            if not cap.isOpened():
                print("[LIVE] ERREUR — impossible d'ouvrir le flux")
                with self.lock:
                    self.stats["error"] = True
                self._show_error_frame("Connexion impossible")
                time.sleep(RECONNECT_DELAY)
                continue

            cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)

            W = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
            H = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
            print(f"[LIVE] Résolution : {W}x{H}")

            coords, _ = load_coords(W, H, self.cam_id)
            polys, centers = precompute_polys(coords)
            sensor_flags = load_sensor_flags(self.cam_id)
            votes  = [deque(maxlen=self.vote_window) for _ in range(len(coords))]
            states = [True] * len(coords)
            print(f"[LIVE] {len(coords)} places chargées ({sum(sensor_flags[:len(coords)])} capteur)")

            # Thread de capture
            latest_frame = [None]
            last_frame_time = [time.time()]
            grab_lock    = threading.Lock()
            grab_running = [True]

            def grab_thread():
                while grab_running[0]:
                    ret, f = cap.read()
                    if not ret:
                        time.sleep(0.01)
                        continue
                    with grab_lock:
                        latest_frame[0] = f.copy()
                        last_frame_time[0] = time.time()

            grabber = threading.Thread(target=grab_thread, daemon=True)
            grabber.start()

            # Attendre la première frame
            got_frame = False
            for _ in range(50):
                with grab_lock:
                    if latest_frame[0] is not None:
                        got_frame = True
                        break
                time.sleep(0.1)
            
            if not got_frame:
                print("[LIVE] Timeout — aucune frame reçue")
                with self.lock:
                    self.stats["error"] = True
                self._show_error_frame("Aucune frame reçue")
                grab_running[0] = False
                grabber.join(timeout=2)
                cap.release()
                if self.running:
                    time.sleep(RECONNECT_DELAY)
                continue

            # Première frame OK — connexion établie
            with self.lock:
                self.stats["error"] = False
            print(f"[LIVE] Flux OK — {W}x{H}")

            frame_id      = 0
            last_vehicles = []
            coords_mtime  = 0
            stream_ok     = True

            # Thread YOLO asynchrone : tourne en parallèle du rendu
            yolo_frame    = [None]  # frame à analyser
            yolo_result   = [[] ]   # résultat de la dernière détection
            yolo_lock     = threading.Lock()
            yolo_event    = threading.Event()
            yolo_running  = [True]

            def yolo_thread():
                while yolo_running[0]:
                    yolo_event.wait(timeout=0.1)
                    yolo_event.clear()
                    with yolo_lock:
                        f = yolo_frame[0]
                        yolo_frame[0] = None
                    if f is not None:
                        vehicles = YOLODetector.detect(f)
                        with yolo_lock:
                            yolo_result[0] = vehicles

            yolo_worker = threading.Thread(target=yolo_thread, daemon=True)
            yolo_worker.start()

            while self.running and stream_ok:
                t0 = time.time()

                # Vérifier que le flux est toujours actif
                with grab_lock:
                    elapsed = time.time() - last_frame_time[0]
                if elapsed > 3.0 and frame_id > 0:
                    print("[LIVE] Flux perdu, tentative de reconnexion...")
                    with self.lock:
                        self.stats["error"] = True
                    self._show_error_frame("Flux interrompu — reconnexion...")
                    stream_ok = False
                    break

                # Copie stable de la frame
                with grab_lock:
                    if latest_frame[0] is None:
                        frame = None
                    else:
                        frame = latest_frame[0].copy()
                if frame is None:
                    time.sleep(0.05)
                    continue

                frame_id += 1

                # Recharger le masque si modifié
                new_coords, coords_path = load_coords(W, H, self.cam_id)
                if coords_path:
                    mt = os.path.getmtime(coords_path)
                    if mt != coords_mtime:
                        coords = new_coords
                        polys, centers = precompute_polys(coords)
                        sensor_flags = load_sensor_flags(self.cam_id)
                        votes  = [deque(maxlen=self.vote_window) for _ in range(len(coords))]
                        states = [True] * len(coords)
                        coords_mtime = mt

                # Ajuster la fenêtre de vote si modifiée
                if votes and votes[0].maxlen != self.vote_window:
                    votes  = [deque(maxlen=self.vote_window) for _ in range(len(coords))]
                    states = [True] * len(coords)

                # Envoyer la frame au thread YOLO (non bloquant)
                if frame_id % SETTINGS['process_every'] == 0 and self.yolo_enabled:
                    with yolo_lock:
                        yolo_frame[0] = frame.copy()
                    yolo_event.set()

                # Récupérer le dernier résultat YOLO disponible
                if self.yolo_enabled:
                    with yolo_lock:
                        last_vehicles = yolo_result[0]
                else:
                    last_vehicles = []
                    with yolo_lock:
                        yolo_result[0] = []
                vehicles = last_vehicles

                # Masque + détection
                dp = self.detect_point
                dh = self.detect_horizontal
                if self.mask_enabled and polys:
                    update_votes(polys, vehicles, votes, states, dp, dh, sensor_flags)
                    if self.streaming:
                        free, occ = draw_overlay(frame, polys, centers, states, vehicles, dp, dh, sensor_flags)
                    else:
                        # Mode headless : compter sans dessiner
                        free = occ = 0
                        for i in range(len(polys)):
                            is_sensor = i < len(sensor_flags) and sensor_flags[i]
                            if is_sensor:
                                continue
                            if states[i]: free += 1
                            else: occ += 1
                else:
                    if self.streaming:
                        for (x, y, w, h) in vehicles:
                            cx, cy = x + w//2, y + h//2
                            cv2.line(frame, (cx-4, cy), (cx+4, cy), (255,255,0), 2)
                            cv2.line(frame, (cx, cy-4), (cx, cy+4), (255,255,0), 2)
                    free = occ = 0

                total = free + occ
                n_sensor = sum(1 for i in range(len(polys)) if i < len(sensor_flags) and sensor_flags[i])

                # Détection de problème caméra
                cam_health = "ok"
                if frame_id % (SETTINGS['process_every'] * 2) == 0:
                    gray_mean = np.mean(frame)
                    if gray_mean < 8:
                        cam_health = "noir"
                    elif hasattr(self, '_prev_health_frame'):
                        diff = cv2.absdiff(frame, self._prev_health_frame)
                        if np.mean(diff) < 0.5:
                            cam_health = "figé"
                    self._prev_health_frame = frame.copy()

                frame_time = time.time() - t0

                if self.streaming:
                    draw_hud(frame, free, occ, total)
                    _, jpeg = cv2.imencode(".jpg", frame, [cv2.IMWRITE_JPEG_QUALITY, SETTINGS['jpeg_quality']])
                    with self.lock:
                        self._annotated = jpeg.tobytes()
                        self.stats = {"free": free, "occ": occ, "total": total,
                                      "total_places": len(polys),
                                      "n_sensor": n_sensor,
                                      "error": False,
                                      "cam_health": cam_health,
                                      "yolo_available": YOLODetector.get(),
                                      "yolo_enabled": self.yolo_enabled,
                                      "yolo_ms": round(YOLODetector._detect_total / max(YOLODetector._detect_count, 1) * 1000),
                                      "frame_ms": round(frame_time * 1000)}
                    self.frame_event.set()
                    self.frame_event.clear()
                else:
                    with self.lock:
                        self.stats = {"free": free, "occ": occ, "total": total,
                                      "total_places": len(polys),
                                      "n_sensor": n_sensor,
                                      "error": False,
                                      "cam_health": cam_health,
                                      "yolo_available": YOLODetector.get(),
                                      "yolo_enabled": self.yolo_enabled,
                                      "yolo_ms": round(YOLODetector._detect_total / max(YOLODetector._detect_count, 1) * 1000),
                                      "frame_ms": round(frame_time * 1000)}

                # Limiter le FPS
                delay = 1.0 / SETTINGS['stream_fps']
                wait = delay - (time.time() - t0)
                if wait > 0:
                    time.sleep(wait)

            # Nettoyage avant reconnexion
            yolo_running[0] = False
            yolo_event.set()
            yolo_worker.join(timeout=2)
            grab_running[0] = False
            grabber.join(timeout=2)
            cap.release()

            if self.running:
                time.sleep(RECONNECT_DELAY)

        self.running = False
        print("[LIVE] Arrêté")

    def _show_error_frame(self, message):
        """Génère une frame noire avec un message d'erreur."""
        if not self.streaming:
            return
        blank = np.zeros((360, 640, 3), dtype=np.uint8)
        draw_centered_text(blank, message, color=(0, 80, 255))
        _, jpeg = cv2.imencode(".jpg", blank)
        with self.lock:
            self._annotated = jpeg.tobytes()
        self.frame_event.set()
        self.frame_event.clear()


# ══════════════════════════════════════════
# DEMO ENGINE  (lecture fichier vidéo)
# ══════════════════════════════════════════

class DemoEngine:
    def __init__(self):
        self.running      = False
        self.paused       = False
        self.yolo_enabled = True
        self.thread       = None
        self.lock         = threading.Lock()
        self._annotated   = None
        self.frame_event  = threading.Event()
        self._seek_to     = None   # frame cible pour un seek (None = pas de seek)
        self.stats        = {"free": 0, "occ": 0, "total": 0, "frame": 0,
                             "total_frames": 0, "yolo_available": False,
                             "yolo_enabled": True, "finished": False, "paused": False}

    def start(self, video_path):
        if self.running:
            self.stop()
        self.video_path = video_path
        self.running    = True
        self.thread     = threading.Thread(target=self._loop, daemon=True)
        self.thread.start()

    def stop(self):
        self.running = False
        self.paused  = False
        if self.thread and self.thread.is_alive():
            self.thread.join(timeout=3)
        self._annotated = None

    def pause(self):
        self.paused = not self.paused

    def seek(self, frame_num):
        self._seek_to = int(frame_num)

    def get_jpeg(self):
        with self.lock:
            return self._annotated

    def _loop(self):
        print(f"[DEMO] Ouverture : {self.video_path}")
        cap = cv2.VideoCapture(self.video_path)
        if not cap.isOpened():
            print(f"[DEMO] ERREUR — impossible d'ouvrir la vidéo")
            self.running = False
            return

        total_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        fps          = cap.get(cv2.CAP_PROP_FPS) or 25
        W = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
        H = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
        print(f"[DEMO] {W}x{H}  {fps:.1f}fps  {total_frames} frames")

        coords, fname = load_coords(W, H)
        if fname:
            print(f"[DEMO] Masque : {os.path.basename(fname)} ({len(coords)} places)")

        polys, centers = precompute_polys(coords)
        votes         = [deque(maxlen=SETTINGS['vote_window']) for _ in range(len(coords))]
        states        = [True] * len(coords)
        coords_mtime  = os.path.getmtime(fname) if fname else 0
        frame_id      = 0
        last_vehicles = []
        delay         = 1.0 / fps

        while self.running:
            # Recharger coords si le fichier a été modifié
            for cname in [
                os.path.join(COORDS_DIR, f"parking_coords_{W}x{H}.json"),
                os.path.join(COORDS_DIR, "parking_coords.json"),
            ]:
                if os.path.exists(cname):
                    mt = os.path.getmtime(cname)
                    if mt != coords_mtime:
                        with open(cname) as f:
                            coords = _normalize_coords(json.load(f))
                        polys, centers = precompute_polys(coords)
                        votes  = [deque(maxlen=SETTINGS['vote_window']) for _ in range(len(coords))]
                        states = [True] * len(coords)
                        coords_mtime = mt
                        print(f"[DEMO] Masque rechargé : {len(coords)} places")
                    break
            # Seek : se déplacer à une frame spécifique
            if self._seek_to is not None:
                cap.set(cv2.CAP_PROP_POS_FRAMES, self._seek_to)
                frame_id      = self._seek_to
                self._seek_to = None
                last_vehicles = []

            # Pause : attendre sans consommer de frames
            if self.paused:
                with self.lock:
                    self.stats["paused"] = True
                time.sleep(0.05)
                continue

            t0 = time.time()
            ret, frame = cap.read()
            if not ret:
                with self.lock:
                    self.stats["finished"] = True
                break

            frame_id += 1

            # YOLO
            if frame_id % SETTINGS['process_every'] == 0:
                last_vehicles = YOLODetector.detect(frame) if self.yolo_enabled else []
            vehicles = last_vehicles

            # Masque + détection (mode démo : centre YOLO, pas de correction de perspective)
            if polys:
                update_votes(polys, vehicles, votes, states, detect_point=50, detect_horizontal=50)
                free, occ = draw_overlay(frame, polys, centers, states, vehicles, detect_point=50, detect_horizontal=50, show_crosshair=False)
            else:
                free = occ = 0

            # HUD avec progression
            total = free + occ
            pct   = int(free / total * 100) if total > 0 else 0
            draw_hud(frame, free, occ, total, f"({pct}%)")

            # Barre de progression en bas
            prog_w = int(W * frame_id / total_frames) if total_frames > 0 else 0
            cv2.rectangle(frame, (0, H-6), (W, H), (20,20,20), -1)
            cv2.rectangle(frame, (0, H-6), (prog_w, H), (0,180,220), -1)

            _, jpeg = cv2.imencode(".jpg", frame, [cv2.IMWRITE_JPEG_QUALITY, SETTINGS['jpeg_quality']])
            with self.lock:
                self._annotated = jpeg.tobytes()
                self.stats = {"free": free, "occ": occ, "total": total,
                              "frame": frame_id, "total_frames": total_frames,
                              "yolo_available": YOLODetector.get(),
                              "yolo_enabled": self.yolo_enabled,
                              "finished": False, "paused": self.paused}
            self.frame_event.set()
            self.frame_event.clear()

            wait = delay - (time.time() - t0)
            if wait > 0:
                time.sleep(wait)

        cap.release()
        self.running = False
        print("[DEMO] Terminé")


# Instances globales
engine = LiveEngine()
demo   = DemoEngine()


# ══════════════════════════════════════════
# ROUTES — ÉDITEUR DE PLACES
# ══════════════════════════════════════════

def find_images():
    exts = ["*.jpg","*.jpeg","*.png","*.JPG","*.JPEG","*.PNG"]
    imgs = []
    for e in exts:
        imgs.extend(glob.glob(os.path.join(CAPTURES_DIR, e)))
    return [os.path.basename(f) for f in imgs]

def coords_filename(cam_id, image_name):
    """Génère le nom du fichier de masque : parking_coords_{cam_id}_{image_base}.json"""
    base = os.path.splitext(os.path.basename(image_name))[0]
    # Nettoyer le nom pour éviter les caractères spéciaux
    safe = re.sub(r'[^a-zA-Z0-9_-]', '_', base).strip('_')
    if cam_id:
        return f"parking_coords_{cam_id}_{safe}.json"
    return f"parking_coords_{safe}.json"

@app.route("/")
def index():
    return render_template("base.html")

@app.route("/api/images")
def api_images():
    return jsonify(find_images())

@app.route("/api/image/<filename>")
def api_image(filename):
    path = os.path.join(CAPTURES_DIR, os.path.basename(filename))
    if not os.path.exists(path):
        return jsonify({"error": "Image non trouvée"}), 404
    return send_file(path)

@app.route("/api/coords/<filename>")
def api_load_coords(filename):
    cam_id = request.args.get("cam_id", "")
    jf   = coords_filename(cam_id, filename) if cam_id else coords_filename("default", filename)
    path = os.path.join(COORDS_DIR, jf)
    if os.path.exists(path):
        with open(path) as f:
            data = json.load(f)
        return jsonify({"coords": data, "file": jf})
    # Fallback: chercher l'ancien format sans cam_id (rétrocompatibilité)
    m = re.search(r'(\d+)x(\d+)', filename)
    if m:
        old_jf = f"parking_coords_{m.group(1)}x{m.group(2)}.json"
        old_path = os.path.join(COORDS_DIR, old_jf)
        if os.path.exists(old_path):
            with open(old_path) as f:
                data = json.load(f)
            return jsonify({"coords": data, "file": old_jf})
    return jsonify({"coords": [], "file": jf})

@app.route("/api/coords/<filename>", methods=["POST"])
def api_save_coords(filename):
    coords = request.json.get("coords", [])
    cam_id = request.json.get("cam_id", "")
    jf     = coords_filename(cam_id, filename) if cam_id else coords_filename("default", filename)
    path   = os.path.join(COORDS_DIR, jf)
    with open(path, "w") as f:
        json.dump(coords, f, indent=2)
    # Compter les places (nouveau format objet ou ancien format tableau)
    count = len(coords)
    print(f"[SAVE] {jf} — {count} places")
    return jsonify({"success": True, "file": jf, "count": count})

@app.route("/api/image_size/<filename>")
def api_image_size(filename):
    path = os.path.join(CAPTURES_DIR, os.path.basename(filename))
    if not os.path.exists(path):
        return jsonify({"error": "non trouvée"}), 404
    img = cv2.imread(path)
    if img is None:
        return jsonify({"error": "lecture impossible"}), 500
    h, w = img.shape[:2]
    return jsonify({"width": w, "height": h})


@app.route("/api/sensor_places", methods=["GET"])
def api_sensor_get():
    cam_id = request.args.get("cam_id")
    image_name = request.args.get("image_name")
    if cam_id and image_name:
        base = re.sub(r'[^a-zA-Z0-9_-]', '_', os.path.splitext(image_name)[0]).strip('_')
        fname = os.path.join(SENSORS_DIR, f"sensor_places_{cam_id}_{base}.json")
        if os.path.exists(fname):
            with open(fname) as f:
                return jsonify({"flags": json.load(f)})
    flags = load_sensor_flags(cam_id)
    return jsonify({"flags": flags})

@app.route("/api/sensor_places", methods=["POST"])
def api_sensor_post():
    data = request.json or {}
    cam_id = data.get("cam_id")
    image_name = data.get("image_name")
    flags = data.get("flags", [])
    save_sensor_flags(flags, cam_id, image_name)
    return jsonify({"ok": True})

@app.route("/api/cameras/active_mask", methods=["POST"])
def api_set_active_mask():
    data = request.json or {}
    cam_id = data.get("cam_id")
    image_name = data.get("image_name")
    if not cam_id:
        return jsonify({"ok": False, "error": "cam_id requis"})
    cameras = load_cameras()
    for cam in cameras:
        if cam["id"] == cam_id:
            cam["active_mask"] = image_name
            break
    save_cameras(cameras)
    print(f"[MASK] Masque actif pour {cam_id} : {image_name}", flush=True)
    return jsonify({"ok": True})

@app.route("/api/cameras/active_mask", methods=["GET"])
def api_get_active_mask():
    cam_id = request.args.get("cam_id", "")
    cameras = load_cameras()
    cam = next((c for c in cameras if c["id"] == cam_id), None)
    mask = cam.get("active_mask", "") if cam else ""
    return jsonify({"cam_id": cam_id, "active_mask": mask})


# ══════════════════════════════════════════
# ROUTES — GESTION AVANCÉE
# ══════════════════════════════════════════

@app.route("/api/manage/rename", methods=["POST"])
def manage_rename():
    data    = request.json or {}
    old     = os.path.basename(data.get("old", ""))
    new     = os.path.basename(data.get("new", ""))
    if not old or not new:
        return jsonify({"ok": False, "error": "Noms manquants"})
    old_path = os.path.join(CAPTURES_DIR, old)
    new_path = os.path.join(CAPTURES_DIR, new)
    if not os.path.exists(old_path):
        return jsonify({"ok": False, "error": "Image introuvable"})
    if os.path.exists(new_path):
        return jsonify({"ok": False, "error": "Ce nom existe déjà"})
    os.rename(old_path, new_path)
    # Renommer tous les fichiers de coords associés (toutes caméras)
    m_old = re.search(r'(\d+)x(\d+)', old)
    m_new = re.search(r'(\d+)x(\d+)', new)
    if m_old:
        pattern = os.path.join(COORDS_DIR, f"parking_coords_*_{m_old.group(1)}x{m_old.group(2)}.json")
        for old_cf in glob.glob(pattern):
            if m_new:
                new_cf = old_cf.replace(f"_{m_old.group(1)}x{m_old.group(2)}.json", f"_{m_new.group(1)}x{m_new.group(2)}.json")
                os.rename(old_cf, new_cf)
    print(f"[MANAGE] Renommé : {old} → {new}")
    return jsonify({"ok": True})

@app.route("/api/manage/delete", methods=["POST"])
def manage_delete():
    filename = os.path.basename((request.json or {}).get("filename", ""))
    if not filename:
        return jsonify({"ok": False, "error": "Nom manquant"})
    path = os.path.join(CAPTURES_DIR, filename)
    if not os.path.exists(path):
        return jsonify({"ok": False, "error": "Image introuvable"})
    os.remove(path)
    # Supprimer tous les fichiers de coords associés (toutes caméras)
    m = re.search(r'(\d+)x(\d+)', filename)
    if m:
        pattern = os.path.join(COORDS_DIR, f"parking_coords_*_{m.group(1)}x{m.group(2)}.json")
        for cf in glob.glob(pattern):
            os.remove(cf)
    print(f"[MANAGE] Supprimé : {filename}")
    return jsonify({"ok": True})

@app.route("/api/manage/upload", methods=["POST"])
def manage_upload():
    if "file" not in request.files:
        return jsonify({"ok": False, "error": "Aucun fichier"})
    f    = request.files["file"]
    name = os.path.basename(f.filename)
    if not name:
        return jsonify({"ok": False, "error": "Nom invalide"})
    exts = {".jpg", ".jpeg", ".png"}
    if os.path.splitext(name)[1].lower() not in exts:
        return jsonify({"ok": False, "error": "Format non supporté (jpg/png)"})
    dest = os.path.join(CAPTURES_DIR, name)
    f.save(dest)
    print(f"[MANAGE] Upload : {name}")
    return jsonify({"ok": True, "filename": name})

@app.route("/api/manage/duplicate_mask", methods=["POST"])
def manage_duplicate_mask():
    """Copie un fichier de coords vers une nouvelle résolution cible."""
    data = request.json or {}
    src_img  = os.path.basename(data.get("src_image", ""))
    cam_id   = data.get("cam_id", "default")
    dst_w    = int(data.get("dst_w", 0))
    dst_h    = int(data.get("dst_h", 0))
    if not src_img or not dst_w or not dst_h:
        return jsonify({"ok": False, "error": "Paramètres manquants"})
    src_cf = os.path.join(COORDS_DIR, coords_filename(cam_id, src_img))
    if not os.path.exists(src_cf):
        return jsonify({"ok": False, "error": "Aucun masque pour cette image/caméra"})
    with open(src_cf) as f:
        raw_coords = json.load(f)
    coords = _normalize_coords(raw_coords)
    src_path = os.path.join(CAPTURES_DIR, src_img)
    img = cv2.imread(src_path)
    if img is None:
        return jsonify({"ok": False, "error": "Impossible de lire l'image source"})
    src_h, src_w = img.shape[:2]
    sx = dst_w / src_w
    sy = dst_h / src_h
    # Reconstruire avec type si présent dans le format d'origine
    new_coords = []
    for i, zone in enumerate(coords):
        scaled_pts = [[int(p[0]*sx), int(p[1]*sy)] for p in zone]
        if isinstance(raw_coords[i], dict) and "type" in raw_coords[i]:
            new_coords.append({"pts": scaled_pts, "type": raw_coords[i]["type"]})
        else:
            new_coords.append(scaled_pts)
    dst_cf = os.path.join(COORDS_DIR, f"parking_coords_{cam_id}_{dst_w}x{dst_h}.json")
    with open(dst_cf, "w") as f:
        json.dump(new_coords, f, indent=2)
    print(f"[MANAGE] Masque dupliqué → {cam_id}_{dst_w}x{dst_h} ({len(new_coords)} places)")
    return jsonify({"ok": True, "file": os.path.basename(dst_cf), "count": len(new_coords)})

@app.route("/api/manage/export_csv/<filename>")
def manage_export_csv(filename):
    """Exporte les coords d'une image en CSV."""
    cam_id = request.args.get("cam_id", "default")
    cf = os.path.join(COORDS_DIR, coords_filename(cam_id, os.path.basename(filename)))
    if not os.path.exists(cf):
        return jsonify({"error": "Aucun masque pour cette image/caméra"}), 404
    with open(cf) as f:
        coords = _normalize_coords(json.load(f))
    lines = ["place,point,x,y"]
    for i, zone in enumerate(coords):
        for j, pt in enumerate(zone):
            lines.append(f"{i+1},{j+1},{pt[0]},{pt[1]}")
    csv_data = "\n".join(lines)
    return Response(csv_data, mimetype="text/csv",
                    headers={"Content-Disposition": f"attachment; filename=masque_{os.path.splitext(filename)[0]}.csv"})


# ══════════════════════════════════════════
# ROUTES — DÉMO VIDÉO
# ══════════════════════════════════════════

@app.route("/api/demo/videos")
def demo_videos():
    exts  = ["*.mp4","*.MP4","*.avi","*.AVI","*.mkv","*.MKV"]
    files = []
    for e in exts:
        files.extend(glob.glob(os.path.join(VIDEOS_DIR, e)))
    return jsonify({"files": sorted([os.path.basename(f) for f in files])})

@app.route("/api/demo/start", methods=["POST"])
def demo_start():
    video = (request.json or {}).get("video")
    if not video:
        return jsonify({"ok": False, "error": "Nom de vidéo manquant"})
    path = os.path.join(VIDEOS_DIR, os.path.basename(video))
    if not os.path.exists(path):
        return jsonify({"ok": False, "error": f"Fichier introuvable : {video}"})
    # Arrêter le XBee et le moteur live
    xbee.stop()
    engine.stop()
    demo.start(path)
    return jsonify({"ok": True})

@app.route("/api/demo/stop", methods=["POST"])
def demo_stop_route():
    demo.stop()
    # Relancer la détection live en headless
    cameras = load_cameras()
    default_id = SETTINGS.get('default_camera', '')
    cam = next((c for c in cameras if c['id'] == default_id), None)
    if not cam and cameras:
        cam = cameras[0]
    if cam:
        source = camera_rtsp_url(cam)
        engine.start(source, cam_id=cam['id'])
        engine.streaming = False
        print(f"[DEMO] Terminé — détection relancée sur {cam['name']}", flush=True)
    # Relancer le XBee s'il était activé
    if SETTINGS.get('xbee_enabled'):
        xbee.start()
    return jsonify({"ok": True})

@app.route("/api/demo/stats")
def demo_stats():
    return jsonify(demo.stats)

@app.route("/api/demo/yolo", methods=["POST"])
def demo_yolo():
    demo.yolo_enabled = (request.json or {}).get("enabled", True)
    return jsonify({"ok": True})

@app.route("/api/demo/pause", methods=["POST"])
def demo_pause():
    demo.pause()
    return jsonify({"ok": True, "paused": demo.paused})

@app.route("/api/demo/seek", methods=["POST"])
def demo_seek():
    pct = (request.json or {}).get("pct", 0)   # pourcentage 0-100
    if demo.stats["total_frames"] > 0:
        frame_num = int(pct / 100 * demo.stats["total_frames"])
        demo.seek(frame_num)
    return jsonify({"ok": True})

@app.route("/demo_feed")
def demo_feed():
    def generate():
        while True:
            demo.frame_event.wait(timeout=0.2)
            jpeg = demo.get_jpeg()
            if jpeg is None:
                blank = np.zeros((360,640,3), dtype=np.uint8)
                draw_centered_text(blank, "En attente de la vidéo...")
                _, j = cv2.imencode(".jpg", blank)
                jpeg = j.tobytes()
            yield b"--frame\r\nContent-Type: image/jpeg\r\n\r\n" + jpeg + b"\r\n"
    return Response(generate(), mimetype="multipart/x-mixed-replace; boundary=frame")


# ══════════════════════════════════════════
# ROUTES — CAMÉRAS
# ══════════════════════════════════════════

@app.route("/api/cameras")
def api_cameras():
    return jsonify(load_cameras())

@app.route("/api/cameras/save", methods=["POST"])
def api_cameras_save():
    cameras = request.json
    if not isinstance(cameras, list):
        return jsonify({"ok": False, "error": "Format invalide"}), 400
    save_cameras(cameras)
    print(f"[CAMERAS] Sauvegardé : {len(cameras)} caméra(s)")
    return jsonify({"ok": True, "count": len(cameras)})

@app.route("/api/cameras/scan", methods=["POST"])
def api_cameras_scan():
    """Scanne le réseau local pour trouver les appareils avec un port RTSP ouvert (554 ou 8554)."""
    import socket, ipaddress, concurrent.futures

    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        local_ip = s.getsockname()[0]
        s.close()
    except:
        return jsonify({"ok": False, "error": "Impossible de déterminer l'IP locale"})

    network = ipaddress.IPv4Network(local_ip + "/24", strict=False)
    found = []
    rtsp_ports = [554, 8554]

    def check_ip(ip_str):
        if ip_str == local_ip:
            return None
        for port in rtsp_ports:
            try:
                sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                sock.settimeout(0.3)
                result = sock.connect_ex((ip_str, port))
                sock.close()
                if result == 0:
                    try:
                        hostname = socket.gethostbyaddr(ip_str)[0]
                    except:
                        hostname = ""
                    return {"ip": ip_str, "port": port, "hostname": hostname}
            except:
                pass
        return None

    print(f"[SCAN] Scan du réseau {network} (ports {rtsp_ports})...")
    with concurrent.futures.ThreadPoolExecutor(max_workers=50) as executor:
        futures = {executor.submit(check_ip, str(ip)): str(ip) for ip in network.hosts()}
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            if result:
                found.append(result)
                print(f"[SCAN] Trouvé : {result['ip']}:{result['port']} ({result['hostname'] or '?'})")

    print(f"[SCAN] Terminé — {len(found)} appareil(s) avec port RTSP ouvert")
    return jsonify({"ok": True, "devices": found, "local_ip": local_ip})

@app.route("/api/capture", methods=["POST"])
def api_capture():
    """Capture un screenshot depuis une caméra RTSP et le sauvegarde comme image."""
    data   = request.json or {}
    cam_id = data.get("camera_id")
    if not cam_id:
        return jsonify({"ok": False, "error": "Aucune caméra spécifiée"})
    cameras = load_cameras()
    cam = next((c for c in cameras if c["id"] == cam_id), None)
    if not cam:
        return jsonify({"ok": False, "error": "Caméra introuvable"})
    url = camera_rtsp_url(cam)
    print(f"[CAPTURE] Connexion à {cam['name']} ({cam['ip']})...")
    cap = cv2.VideoCapture(url)
    if not cap.isOpened():
        return jsonify({"ok": False, "error": "Impossible de se connecter à la caméra"})
    # Lire quelques frames pour stabiliser
    for _ in range(5):
        ret, frame = cap.read()
    cap.release()
    if not ret or frame is None:
        return jsonify({"ok": False, "error": "Impossible de lire une frame"})
    H, W = frame.shape[:2]
    # Nom : camera + resolution
    safe_name = re.sub(r'[^a-zA-Z0-9_-]', '_', cam['name']).strip('_')
    filename = f"capture_{safe_name}_{W}x{H}.jpg"
    filepath = os.path.join(CAPTURES_DIR, filename)
    cv2.imwrite(filepath, frame, [cv2.IMWRITE_JPEG_QUALITY, 95])
    print(f"[CAPTURE] Sauvegardé : {filename} ({W}x{H})")
    return jsonify({"ok": True, "filename": filename, "width": W, "height": H})


# ══════════════════════════════════════════
# ROUTES — LIVE VIEW
# ══════════════════════════════════════════

@app.route("/api/live/start", methods=["POST"])
def live_start():
    data = request.json or {}
    source = data.get("source", None)
    cam_id = data.get("camera_id")
    if cam_id:
        cams = load_cameras()
        cam = next((c for c in cams if c["id"] == cam_id), None)
        if cam:
            source = camera_rtsp_url(cam)
            print(f"[LIVE] Caméra sélectionnée : {cam['name']} ({cam['ip']})")
    if demo.running:
        demo.stop()
    if engine.running:
        engine.stop()
        time.sleep(0.5)
    engine.start(source, cam_id=cam_id)
    engine.streaming = True
    xbee.start()
    return jsonify({"ok": True})

@app.route("/api/live/stop", methods=["POST"])
def live_stop():
    engine.streaming = False
    return jsonify({"ok": True})

@app.route("/api/live/stop_all", methods=["POST"])
def live_stop_all():
    """Arrête complètement le moteur (détection + flux)."""
    engine.stop()
    return jsonify({"ok": True})

@app.route("/api/live/stats")
def live_stats():
    stats = dict(engine.stats)
    # Toujours refléter l'état actuel (pas le dict figé quand la boucle ne tourne pas)
    stats["yolo_enabled"] = engine.yolo_enabled
    stats["mask_enabled"] = engine.mask_enabled
    try:
        with open("/sys/class/thermal/thermal_zone0/temp") as f:
            stats["cpu_temp"] = round(int(f.read().strip()) / 1000, 1)
    except:
        stats["cpu_temp"] = None
    stats["xbee_active"] = xbee._running
    stats["streaming"] = engine.streaming
    stats["detection_running"] = engine.running
    stats["engine_cam_id"] = engine.cam_id
    stats["default_camera"] = SETTINGS.get('default_camera', '')
    return jsonify(stats)

@app.route("/api/xbee/start", methods=["POST"])
def xbee_start():
    SETTINGS['xbee_enabled'] = True
    save_settings(SETTINGS)
    xbee.start()
    return jsonify({"ok": True, "active": xbee._running})

@app.route("/api/xbee/stop", methods=["POST"])
def xbee_stop():
    SETTINGS['xbee_enabled'] = False
    save_settings(SETTINGS)
    xbee.stop()
    return jsonify({"ok": True})

@app.route("/api/xbee/detect", methods=["POST"])
def xbee_detect():
    """Auto-détecte le port et baud rate du XBee."""
    if not _HAS_SERIAL:
        return jsonify({"ok": False, "error": "pyserial non installé"})
    port, baud = XBeeSender._auto_detect()
    if port:
        SETTINGS['xbee_port'] = port
        SETTINGS['xbee_baud'] = baud
        save_settings(SETTINGS)
        return jsonify({"ok": True, "port": port, "baud": baud})
    return jsonify({"ok": False, "error": "Aucun XBee trouvé"})

@app.route("/api/cameras/test", methods=["POST"])
def api_cameras_test():
    """Teste la connexion RTSP d'une caméra."""
    import socket as _socket
    data = request.json or {}
    ip   = data.get('ip', '')
    port = int(data.get('port', 554))

    # Test 1 : vérifier si l'IP est accessible
    try:
        sock = _socket.socket(_socket.AF_INET, _socket.SOCK_STREAM)
        sock.settimeout(2)
        result = sock.connect_ex((ip, port))
        sock.close()
        if result != 0:
            return jsonify({"ok": False, "error": f"Impossible de joindre {ip}:{port}"})
    except Exception as e:
        return jsonify({"ok": False, "error": f"Impossible de joindre {ip}:{port}"})

    # Test 2 : connexion RTSP
    url = f"rtsp://{data.get('user','admin')}:{data.get('pass','')}@{ip}:{port}/{data.get('path','')}"
    try:
        cap = cv2.VideoCapture(url)
        if not cap.isOpened():
            return jsonify({"ok": False, "error": "IP accessible mais connexion RTSP échouée (vérifiez identifiants ou chemin)"})
        ret, frame = cap.read()
        cap.release()
        if not ret or frame is None:
            return jsonify({"ok": False, "error": "Connecté mais aucune image reçue (vérifiez le chemin du flux)"})
        H, W = frame.shape[:2]
        return jsonify({"ok": True, "width": W, "height": H})
    except Exception as e:
        return jsonify({"ok": False, "error": str(e)})

@app.route("/api/live/yolo", methods=["POST"])
def live_yolo():
    enabled = (request.json or {}).get("enabled", True)
    engine.yolo_enabled = enabled
    SETTINGS['yolo_enabled'] = enabled
    save_settings(SETTINGS)
    return jsonify({"ok": True})

@app.route("/api/live/mask", methods=["POST"])
def live_mask():
    enabled = (request.json or {}).get("enabled", True)
    engine.mask_enabled = enabled
    SETTINGS['mask_enabled'] = enabled
    save_settings(SETTINGS)
    return jsonify({"ok": True})

@app.route("/api/live/detection", methods=["POST"])
def live_detection():
    data = request.json or {}
    if "detect_point" in data:
        engine.detect_point = max(0, min(100, int(data["detect_point"])))
        SETTINGS['detect_point'] = engine.detect_point
    if "detect_horizontal" in data:
        engine.detect_horizontal = max(0, min(100, int(data["detect_horizontal"])))
        SETTINGS['detect_horizontal'] = engine.detect_horizontal
    if "vote_window" in data:
        engine.vote_window = max(3, min(30, int(data["vote_window"])))
        SETTINGS['vote_window'] = engine.vote_window
    save_settings(SETTINGS)
    return jsonify({"ok": True, "detect_point": engine.detect_point,
                    "detect_horizontal": engine.detect_horizontal,
                    "vote_window": engine.vote_window})

@app.route("/api/live/detection", methods=["GET"])
def live_detection_get():
    return jsonify({
        "detect_point": engine.detect_point,
        "detect_horizontal": engine.detect_horizontal,
        "vote_window": engine.vote_window,
        "yolo_enabled": engine.yolo_enabled,
        "mask_enabled": engine.mask_enabled,
    })

@app.route("/api/settings", methods=["GET"])
def api_settings_get():
    return jsonify(SETTINGS)

@app.route("/api/settings", methods=["POST"])
def api_settings_post():
    data = request.json or {}
    for key in data:
        if key in DEFAULT_SETTINGS:
            SETTINGS[key] = data[key]
    save_settings(SETTINGS)
    # Appliquer en temps réel sur le moteur live
    engine.detect_point      = SETTINGS['detect_point']
    engine.detect_horizontal = SETTINGS['detect_horizontal']
    engine.vote_window       = SETTINGS['vote_window']
    engine.yolo_enabled      = SETTINGS['yolo_enabled']
    engine.mask_enabled      = SETTINGS['mask_enabled']
    return jsonify({"ok": True, "settings": SETTINGS})

@app.route("/video_feed")
def video_feed():
    engine.streaming = True  # Assurer que le streaming est activé
    def generate():
        while engine.streaming:
            engine.frame_event.wait(timeout=0.5)
            jpeg = engine.get_jpeg()
            if jpeg is None:
                blank = np.zeros((360,640,3), dtype=np.uint8)
                draw_centered_text(blank, "Chargement du flux...")
                _, j = cv2.imencode(".jpg", blank)
                jpeg = j.tobytes()
            yield b"--frame\r\nContent-Type: image/jpeg\r\n\r\n" + jpeg + b"\r\n"
    return Response(generate(), mimetype="multipart/x-mixed-replace; boundary=frame")


# ══════════════════════════════════════════
# ROUTES — RESET & ABOUT
# ══════════════════════════════════════════

@app.route("/api/reset/settings", methods=["POST"])
def api_reset_settings():
    """Réinitialise les paramètres aux valeurs par défaut."""
    global SETTINGS
    engine.stop()
    SETTINGS = dict(DEFAULT_SETTINGS)
    save_settings(SETTINGS)
    engine.detect_point = SETTINGS['detect_point']
    engine.detect_horizontal = SETTINGS['detect_horizontal']
    engine.vote_window = SETTINGS['vote_window']
    engine.yolo_enabled = SETTINGS['yolo_enabled']
    engine.mask_enabled = SETTINGS['mask_enabled']
    return jsonify({"ok": True})

@app.route("/api/reset/full", methods=["POST"])
def api_reset_full():
    """Réinitialisation complète : supprime tout (settings, coords, captures, sensors)."""
    engine.stop()
    xbee.stop()
    # Supprimer les données
    for d in [COORDS_DIR, SENSORS_DIR, CAPTURES_DIR]:
        if os.path.exists(d):
            shutil.rmtree(d)
            os.makedirs(d, exist_ok=True)
    # Réinitialiser settings et cameras
    global SETTINGS
    SETTINGS = dict(DEFAULT_SETTINGS)
    save_settings(SETTINGS)
    if os.path.exists(CAMERAS_FILE):
        os.remove(CAMERAS_FILE)
    return jsonify({"ok": True})

@app.route("/api/about")
def api_about():
    """Retourne les infos système."""
    import platform
    cam_count = len(load_cameras())
    coords_count = len(glob.glob(os.path.join(COORDS_DIR, "parking_coords_*.json")))
    captures_count = len(glob.glob(os.path.join(CAPTURES_DIR, "*.*")))
    yolo_ok = os.path.exists(os.path.join(MODELS_DIR, YOLO_MODEL))
    # Espace disque
    try:
        st = os.statvfs(APP_DIR)
        disk_free_mb = (st.f_bavail * st.f_frsize) // (1024*1024)
    except:
        disk_free_mb = -1
    return jsonify({
        "version": "0.6",
        "platform": platform.machine(),
        "python": platform.python_version(),
        "yolo_model": YOLO_MODEL if yolo_ok else None,
        "cameras": cam_count,
        "masks": coords_count,
        "captures": captures_count,
        "disk_free_mb": disk_free_mb,
        "app_dir": APP_DIR,
    })



# ══════════════════════════════════════════
# MAIN
# ══════════════════════════════════════════

if __name__ == "__main__":
    import socket
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
    except:
        ip = "localhost"

    yolo_ok = os.path.exists(os.path.join(MODELS_DIR, YOLO_MODEL))
    cameras = load_cameras()
    print("=" * 52)
    print("  Parking Vision Setup Server")
    print("=" * 52)
    print(f"  URL     : http://{ip}:5000")
    print(f"  CAMS    : {len(cameras)} caméra(s)")
    for c in cameras:
        print(f"            → {c['name']} ({c['ip']})")
    print(f"  MODÈLE  : {YOLO_MODEL if yolo_ok else 'ABSENT — détection désactivée'}")
    print(f"  FPS     : {SETTINGS['stream_fps']}   YOLO toutes les {SETTINGS['process_every']} frames")

    # Auto-démarrage détection en mode headless (pas de flux vidéo)
    if cameras:
        default_id = SETTINGS.get('default_camera', '')
        cam = next((c for c in cameras if c['id'] == default_id), None)
        if not cam:
            cam = cameras[0]
        source = camera_rtsp_url(cam)
        print(f"  DETECT  : Démarrage auto → {cam['name']} ({cam['ip']})")
        engine.start(source, cam_id=cam['id'])
        engine.streaming = False
    else:
        print(f"  DETECT  : Aucune caméra configurée")

    if SETTINGS.get('xbee_enabled'):
        print(f"  XBEE    : Auto-démarrage...")
        xbee.start()
        print(f"  XBEE    : {'Actif' if xbee._running else 'Échec'}")
    print()
    app.run(host="0.0.0.0", port=5000, debug=False, threaded=True, use_reloader=False)
