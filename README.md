# Smart Parking — PYNQ-Z2
## Système de détection de places de parking par vision (ARM + FPGA)

---

## 1. Vue d'ensemble

```
┌──────────────┐    RTSP     ┌──────────────────────────────────────────┐
│  Caméra IP   │────────────▶│           PYNQ-Z2 (Zynq SoC)           │
│  (Reolink)   │  Ethernet   │                                        │
└──────────────┘             │  ┌─────────────────────────────────┐    │
                             │  │  ARM (Linux)                    │    │
                             │  │                                 │    │
                             │  │  gestion_des_frames.py          │    │
                             │  │  ├── Détecte la caméra (ARP)    │    │
                             │  │  ├── Capture une image (RTSP)   │    │
                             │  │  ├── Découpe les ROIs           │    │
                             │  │  └── Écrit status.json          │    │
                             │  │                                 │    │
                             │  │  api_server.py (Flask :5000)    │    │
                             │  │  ├── Sert l'interface web       │    │
                             │  │  ├── API REST (settings, ROIs)  │    │
                             │  │  └── Lecture/écriture configs   │    │
                             │  └─────────────────────────────────┘    │
                             │                                        │
                             │  ┌─────────────────────────────────┐    │
                             │  │  FPGA (futur)                   │    │
                             │  │  └── CNN : libre / occupé       │    │
                             │  └─────────────────────────────────┘    │
                             └──────────────────────────────────────────┘
                                          │
                                     port 5000
                                          │
                             ┌────────────▼────────────┐
                             │   PC / Tablette          │
                             │   http://<IP>:5000       │
                             │                          │
                             │   Onglet Éditeur         │
                             │   → Tracer les places    │
                             │                          │
                             │   Onglet Monitoring      │
                             │   → Voir images + ROIs   │
                             │   → Modifier paramètres  │
                             │                          │
                             │   Onglet Live View       │
                             │   → Flux temps réel      │
                             └──────────────────────────┘
```

---

## 2. Arborescence du projet

```
/home/xilinx/parking_system/
│
├── code/
│   ├── gestion_des_frames.py    # Pipeline : capture + découpe ROIs
│   └── api_server.py            # API REST Flask + sert l'interface web
│
├── config/
│   ├── settings.json            # Paramètres modifiables (intervalle, taille CNN...)
│   ├── coords.json              # Coordonnées des places (généré par l'éditeur)
│   ├── parking-pipeline.service # Service systemd — pipeline
│   └── parking-api.service      # Service systemd — API
│
├── web/
│   └── parking_interface.html   # Interface web complète (3 onglets)
│
├── data/                        # (créé automatiquement)
│   ├── latest.jpg               # Dernière image capturée
│   ├── status.json              # Statut du pipeline
│   ├── echec.txt                # Message d'erreur (si problème)
│   └── crops/                   # ROIs découpées
│       ├── roi_001.png
│       ├── roi_002.png
│       └── ...
│
├── logs/                        # (créé automatiquement)
│   ├── pipeline.log
│   └── api.log
│
└── README.md                    # Ce fichier
```

---

## 3. Installation pas à pas

### 3.1 Prérequis

- Carte PYNQ-Z2 sous Linux (image PYNQ standard)
- Caméra IP Reolink connectée en Ethernet sur eth0
- PC sur le même réseau pour accéder à l'interface

### 3.2 Connexion SSH à la carte

```bash
ssh xilinx@<IP_DE_LA_CARTE>
# Mot de passe par défaut : xilinx
```

### 3.3 Créer l'arborescence

```bash
mkdir -p /home/xilinx/parking_system/code
mkdir -p /home/xilinx/parking_system/config
mkdir -p /home/xilinx/parking_system/web
mkdir -p /home/xilinx/parking_system/data/crops
mkdir -p /home/xilinx/parking_system/logs
```

### 3.4 Transférer les fichiers

Depuis ton PC, dans le dossier contenant les fichiers téléchargés :

```bash
IP=<IP_DE_LA_CARTE>

scp code/gestion_des_frames.py      xilinx@$IP:/home/xilinx/parking_system/code/
scp code/api_server.py              xilinx@$IP:/home/xilinx/parking_system/code/
scp config/settings.json            xilinx@$IP:/home/xilinx/parking_system/config/
scp config/parking-pipeline.service xilinx@$IP:/home/xilinx/parking_system/config/
scp config/parking-api.service      xilinx@$IP:/home/xilinx/parking_system/config/
scp web/parking_interface.html      xilinx@$IP:/home/xilinx/parking_system/web/
scp README.md                       xilinx@$IP:/home/xilinx/parking_system/
```

### 3.5 Installer les dépendances

Sur la carte (en SSH) :

```bash
sudo pip3 install flask flask-cors --break-system-packages
```

> OpenCV et NumPy sont normalement pré-installés sur l'image PYNQ.
> Si ce n'est pas le cas :
> `sudo pip3 install opencv-python-headless numpy --break-system-packages`

---

## 4. Lancement

### 4.1 Test manuel (recommandé pour la première fois)

Ouvrir **deux terminaux SSH** :

**Terminal 1 — Pipeline :**
```bash
cd /home/xilinx/parking_system
python3 code/gestion_des_frames.py
```

Sortie attendue :
```
[INFO] Parking camera pipeline started
[INFO] Cycle — interval=30s, cnn_size=[224, 224]
[INFO] IPs détectées: ['192.168.2.100']
[OK] Caméra détectée sur 192.168.2.100
[OK] Capture + 6 ROIs (caméra 192.168.2.100)
```

**Terminal 2 — API + Interface :**
```bash
cd /home/xilinx/parking_system
python3 code/api_server.py
```

Sortie attendue :
```
[API] Démarrage du serveur API parking...
[API] Web : /home/xilinx/parking_system/web
 * Running on http://0.0.0.0:5000
```

**Sur ton PC**, ouvrir un navigateur :
```
http://<IP_DE_LA_CARTE>:5000
```

Pour arrêter : **Ctrl+C** dans chaque terminal.

### 4.2 Démarrage automatique (systemd)

Une fois que le test manuel fonctionne :

```bash
# Copier les fichiers service
sudo cp /home/xilinx/parking_system/config/parking-pipeline.service /etc/systemd/system/
sudo cp /home/xilinx/parking_system/config/parking-api.service /etc/systemd/system/

# Recharger systemd
sudo systemctl daemon-reload

# Activer au démarrage
sudo systemctl enable parking-pipeline
sudo systemctl enable parking-api

# Démarrer maintenant
sudo systemctl start parking-pipeline
sudo systemctl start parking-api
```

Vérifier :
```bash
sudo systemctl status parking-pipeline
sudo systemctl status parking-api
```

---

## 5. Utilisation de l'interface web

### 5.1 Onglet Éditeur

1. Sélectionner une image dans le menu déroulant (latest.jpg ou une ROI)
2. Choisir le mode **Manuel**
3. Cliquer **4 points** sur l'image pour tracer une place de parking
4. Répéter pour chaque place
5. Cliquer **Sauvegarder** → les coordonnées sont envoyées dans `coords.json` sur la carte
6. Au prochain cycle, le pipeline utilise ces coordonnées pour découper les ROIs

Raccourcis clavier :
- **Ctrl+Z** : annuler la dernière zone
- **Escape** : annuler les points en cours
- **Delete** : supprimer la zone sélectionnée
- **D** : mode manuel
- **E** : mode éditer
- **Molette** : zoom
- **Alt+clic** : déplacer l'image

### 5.2 Onglet Monitoring

- **Dernière capture** : affiche `latest.jpg` avec ses dimensions
- **Grille ROIs** : affiche toutes les ROIs découpées
- **Statut** : état du pipeline, IP caméra, nombre de ROIs, timestamp
- **Paramètres** : modifier intervalle, taille CNN, timeout RTSP, warmup reads
  - Cliquer **Appliquer** → les changements prennent effet au prochain cycle du pipeline
- **Auto-refresh** : active le rafraîchissement automatique synchronisé sur l'intervalle

### 5.3 Onglet Live View

- Démarrer/arrêter le flux MJPEG
- Comptage en temps réel (libre/occupé) — nécessite le CNN sur FPGA
- Accès aux **paramètres avancés** (template RTSP, precheck delay...)

---

## 6. API REST — Référence

| Méthode | Endpoint             | Description                          |
|---------|----------------------|--------------------------------------|
| GET     | `/`                  | Interface web (HTML)                 |
| GET     | `/api/status`        | Statut du pipeline                   |
| GET     | `/api/settings`      | Paramètres actuels                   |
| POST    | `/api/settings`      | Modifier les paramètres              |
| GET     | `/api/image/latest`  | Dernière image capturée (JPEG)       |
| GET     | `/api/rois`          | Liste des ROIs avec métadonnées      |
| GET     | `/api/rois/<file>`   | Image d'une ROI (PNG)               |
| GET     | `/api/coords`        | Coordonnées des places (JSON)        |
| POST    | `/api/coords`        | Mettre à jour les coordonnées        |

### Exemples curl

```bash
# Voir le statut
curl http://localhost:5000/api/status

# Modifier l'intervalle à 15s et la taille CNN à 128×128
curl -X POST http://localhost:5000/api/settings \
  -H "Content-Type: application/json" \
  -d '{"interval": 15, "cnn_size": [128, 128]}'

# Télécharger la dernière image
curl -o latest.jpg http://localhost:5000/api/image/latest

# Lister les ROIs
curl http://localhost:5000/api/rois
```

---

## 7. Paramètres configurables

| Paramètre        | Type       | Contrainte            | Défaut                          | Description                         |
|-------------------|------------|------------------------|----------------------------------|-------------------------------------|
| `interval`        | int        | >= 5 secondes          | 30                               | Temps entre deux captures           |
| `cnn_size`        | [int, int] | 32–1024 par axe        | [224, 224]                       | Taille de redimensionnement des ROIs|
| `rtsp_template`   | string     | doit contenir `{ip}`   | `rtsp://admin:TPRESEAU!@{ip}...` | URL RTSP (IP remplacée auto)        |
| `rtsp_timeout`    | float      | > 0                    | 0.5                              | Timeout connexion TCP port 554      |
| `warmup_reads`    | int        | >= 1                   | 10                               | Nb max de frames lues avant capture |
| `precheck_delay`  | int        | >= 0                   | 5                                | Délai avant détection caméra        |

Les paramètres sont stockés dans `config/settings.json` et relus **à chaque cycle** du pipeline.
Modifier un paramètre via l'interface = actif au prochain cycle, sans redémarrer.

---

## 8. Flux de données

```
1. Pipeline démarre un cycle
       │
       ▼
2. Lit config/settings.json (paramètres)
       │
       ▼
3. Scanne les IP sur eth0 (ARP)
       │
       ▼
4. Teste chaque IP en RTSP → trouve la caméra
       │
       ▼
5. Capture une frame → data/latest.jpg
       │
       ▼
6. Lit config/coords.json (coordonnées des places)
       │
       ▼
7. Découpe + perspective transform + resize → data/crops/roi_XXX.png
       │
       ▼
8. Écrit data/status.json (état, IP, nb ROIs, timestamp)
       │
       ▼
9. Attend interval secondes → retour à l'étape 1
```

---

## 9. Commandes utiles

```bash
# Redémarrer le pipeline après modif du code
sudo systemctl restart parking-pipeline

# Redémarrer l'API après modif du code
sudo systemctl restart parking-api

# Voir les logs en temps réel
tail -f /home/xilinx/parking_system/logs/pipeline.log
tail -f /home/xilinx/parking_system/logs/api.log

# Arrêter tout
sudo systemctl stop parking-pipeline parking-api

# Désactiver le démarrage automatique
sudo systemctl disable parking-pipeline parking-api

# Vérifier l'espace disque
df -h /home/xilinx

# Voir les fichiers générés
ls -lh /home/xilinx/parking_system/data/
ls -lh /home/xilinx/parking_system/data/crops/
```

---

## 10. Prochaines étapes (FPGA)

Le pipeline est prêt pour l'accélération CNN sur FPGA :

- Les ROIs sont en mémoire sous forme de buffers NumPy (RGB, 224×224, uint8)
- La communication ARM → FPGA se fera via AXI DMA
- Le FPGA renverra un résultat par ROI (libre / occupé)
- Les résultats alimenteront l'onglet Live View (comptage temps réel)
