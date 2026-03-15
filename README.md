# Parking Vision

### Système de détection automatique de places de parking par vision artificielle

Parking Vision utilise une caméra IP, un Raspberry Pi et un modèle YOLOv8 (VisDrone) pour détecter en temps réel les places de parking libres et occupées. Une interface web locale permet la visualisation, la configuration des zones et le suivi en direct.

---

## Présentation

Le système filme un parking en continu via une caméra IP (flux RTSP). Un Raspberry Pi analyse les images avec un modèle YOLO entraîné sur des vues plongeantes (VisDrone) pour détecter les véhicules. En comparant la position des véhicules avec les zones de places définies par l'utilisateur, le système détermine quelles places sont libres ou occupées.

Les données de comptage peuvent être transmises via un module XBee/LoRa (optionnel) pour une intégration avec d'autres systèmes.

Cette branche correspond à la version déployée sur Raspberry Pi.

---

## Fonctionnalités

- **Détection YOLO temps réel** — Modèle YOLOv8s VisDrone (ONNX, 320px) via OpenCV DNN, optimisé pour les vues en plongée
- **Éditeur de places** — 3 modes de tracé (manuel, séparateurs, édition) avec gestion multi-caméras
- **Flux vidéo live** — Streaming MJPEG avec overlay coloré (vert = libre, rouge = occupée) et HUD de comptage
- **Mode démo** — Test sur fichier vidéo local (MP4, AVI, MKV) sans caméra
- **Mode headless** — Détection en arrière-plan 24h/24 sans flux vidéo, économe en CPU
- **Vote majoritaire** — Lissage des détections sur N frames pour éviter les clignotements
- **Communication XBee/LoRa** — Envoi périodique des données de comptage en JSON sur port série
- **Alertes caméra** — Détection d'image noire, figée ou de perte de flux avec signal sonore
- **Interface responsive** — Compatible PC, tablette, mobile et WebView Android (pinch-to-zoom, tactile)
- **Démarrage automatique** — Service systemd avec détection headless au boot

---

## Pré-requis

| Élément | Détail |
|---------|--------|
| Raspberry Pi | Modèle 4 ou 5, 4 Go RAM minimum recommandé |
| OS | Raspberry Pi OS Bookworm (64 bits recommandé) |
| Python | 3.11+ (installé par défaut sur Bookworm) |
| Caméra IP | Compatible RTSP (ex : Reolink, Dahua, Hikvision) |
| Réseau | Wi-Fi ou Ethernet, même réseau que la caméra |
| XBee (optionnel) | Module USB pour transmission LoRa |

---

## Installation

### 1. Installer les dépendances

```bash
sudo apt update && sudo apt install -y python3-opencv
pip install flask numpy --break-system-packages

# Optionnel : pour le module XBee
pip install pyserial --break-system-packages
```

### 2. Cloner le projet

```bash
git clone -b Raspberry \
    https://github.com/Mohamedkaouane21/Last_Project.git \
    $HOME/parking
```

### 3. Obtenir le modèle YOLO

Le modèle `yolov8s_visdrone_320.onnx` (~25 Mo) n'est pas inclus dans le dépôt. Il provient du modèle [mshamrai/yolov8s-visdrone](https://huggingface.co/mshamrai/yolov8s-visdrone) sur Hugging Face, exporté en ONNX avec une taille d'entrée de 320×320 pixels.

#### Option A — Télécharger et convertir soi-même

Cette opération doit être faite **sur un PC** (pas sur le RPi), car elle nécessite PyTorch (~2 Go).

```bash
# Installer ultralytics (sur PC uniquement)
pip install ultralytics

# Télécharger le modèle depuis Hugging Face et l'exporter en ONNX 320px
python3 -c "
from ultralytics import YOLO
model = YOLO('mshamrai/yolov8s-visdrone')
model.export(format='onnx', imgsz=320, simplify=True)
"
```

Cela génère un fichier `best.onnx` dans le dossier courant. Le renommer et le transférer sur le RPi :

```bash
# Renommer
mv best.onnx yolov8s_visdrone_320.onnx

# Transférer sur le Raspberry Pi
scp yolov8s_visdrone_320.onnx pi@192.168.0.15:~/parking/models/
```

#### Option B — Si vous avez déjà le fichier .onnx

```bash
mkdir -p $HOME/parking/models
cp /chemin/vers/yolov8s_visdrone_320.onnx $HOME/parking/models/
```

> **Note :** si le modèle est absent au démarrage, le serveur fonctionne normalement mais la détection YOLO est désactivée silencieusement.

<details>
<summary><strong>Pourquoi 320px et pas 640px ?</strong></summary>

Le Raspberry Pi 4 met ~300ms par inférence à 320px. À 640px, ce serait ~1200ms, soit moins d'une détection par seconde. Le compromis 320px offre un bon équilibre précision/vitesse pour une vue de parking en plongée.
</details>

<details>
<summary><strong>Pourquoi VisDrone ?</strong></summary>

Le dataset VisDrone contient des images prises par des drones (vues plongeantes). C'est exactement l'angle d'une caméra de surveillance de parking, ce qui donne de bien meilleures détections qu'un YOLO entraîné sur COCO (photos au niveau du sol).
</details>

### 4. Lancer l'installation

```bash
cd $HOME/parking
chmod +x setup.sh
./setup.sh
```

Le script `setup.sh` :
- Crée l'arborescence (`data/`, `captures/`, `models/`, `videos/`)
- Migre les fichiers depuis une ancienne installation si nécessaire
- Crée et active le service systemd `SystemVision`

### 5. Vérifier

```bash
sudo systemctl status SystemVision
```

L'interface est accessible à : **http://192.168.0.15:5000**

> L'adresse `192.168.0.15` est l'IP statique du Raspberry Pi (bail DHCP configuré côté routeur). Pour vérifier : `hostname -I`

---

## Structure du projet

```text
parking/
├── parking_server.py          # Serveur Flask + LiveEngine + YOLO + XBee
├── setup.sh                   # Script d'installation et service systemd
├── parking_ui/
│   ├── templates/
│   │   ├── base.html          # Layout commun
│   │   ├── editor.html        # Éditeur de places
│   │   └── live_demo.html     # Live View + Démo vidéo + À propos
│   └── static/
│       ├── js/parking.js      # Frontend vanilla JS (~1700 lignes)
│       └── css/main.css       # Thème clair/sombre
├── data/
│   ├── cameras.json           # Configuration des caméras
│   ├── settings.json          # Réglages (seuils YOLO, FPS, XBee...)
│   ├── coords/                # Masques de places (JSON par image)
│   └── sensors/               # Flags capteurs externes
├── captures/                  # Screenshots des caméras
├── models/                    # Modèle YOLO (.onnx)
└── videos/                    # Fichiers vidéo pour le mode démo
```

---

## Utilisation

### Démarrage rapide

1. **Ajouter une caméra** — Onglet Live View → Ajouter → renseigner IP, port RTSP, identifiants
2. **Capturer un screenshot** — Onglet Éditeur → sélectionner la caméra → Capturer
3. **Tracer les places** — Mode manuel (4 clics par place) ou séparateurs (lignes glissées)
4. **Sauvegarder et activer** — Sauvegarder sur le RPi → cliquer Actif
5. **Définir la caméra par défaut** — Live View → Caméra par défaut (auto-détection au boot)
6. **Lancer le flux** — Démarrer le flux → places colorées en temps réel

### Modes de fonctionnement

| Mode | Description | CPU |
|------|-------------|-----|
| **Headless** | Détection sans flux vidéo, actif au démarrage | ~40% |
| **Streaming** | Flux MJPEG + overlay + HUD pour le navigateur | ~70% |
| **Démo** | Lecture d'un fichier vidéo local, sans caméra | Variable |

### API REST

Le serveur expose 30+ routes JSON sur le port 5000 (sans authentification, réseau local uniquement). Principales routes :

- `GET /api/cameras` — Liste des caméras
- `POST /api/live/start` — Démarrer la détection
- `GET /api/live/stats` — Comptage temps réel
- `GET /video_feed` — Flux MJPEG
- `GET/POST /api/settings` — Réglages

---

## Technologies

| Composant | Technologie | Justification |
|-----------|-------------|---------------|
| Backend | Flask (Python) | Bindings natifs OpenCV/YOLO, simple et léger |
| Frontend | Vanilla JS | Zéro dépendance, zéro build, compatible WebView |
| Streaming | MJPEG | HTTP multipart natif Flask, pas de codec |
| Détection | YOLOv8s VisDrone (ONNX) | Entraîné sur vues plongeantes, 300ms/frame sur RPi |
| Inférence | OpenCV DNN | Installé par défaut, pas besoin de PyTorch (2+ Go) |
| Stockage | Fichiers JSON | Suffisant pour 1-10 caméras, pas de BDD à maintenir |

---

## Commandes utiles

```bash
# Statut du service
sudo systemctl status SystemVision

# Logs en temps réel
journalctl -u SystemVision -f

# Filtrer les logs
journalctl -u SystemVision -f | grep YOLO
journalctl -u SystemVision -f | grep XBEE

# Redémarrer le service
sudo systemctl restart SystemVision

# Arrêter le service
sudo systemctl stop SystemVision
```

---

## Licence

Projet réalisé dans le cadre d'un projet de fin d'études — Mars 2026.
