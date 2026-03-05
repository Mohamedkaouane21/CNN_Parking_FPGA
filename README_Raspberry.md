# Système Vision Parking — Raspberry Pi

## Présentation

Système de détection de places de parking par vision par ordinateur, tournant sur Raspberry Pi 4. Utilise une caméra IP (RTSP) et un modèle YOLO entraîné sur VisDrone pour détecter les véhicules. Les données sont remontées via LoRa (module XBee).

**Composants :**
- Raspberry Pi 4 (4 Go RAM recommandé)
- Caméra IP avec flux RTSP
- Module XBee USB pour communication LoRa
- Interface web de configuration accessible depuis le réseau local

---

## Installation

### Prérequis système

```bash
sudo apt update && sudo apt install -y python3 python3-pip python3-opencv
```

### Dépendances Python

```bash
pip install flask pyserial --break-system-packages
```

### Fichiers à déployer

Copier depuis le PC vers le Raspberry Pi :

```bash
scp parking_setup_server_v2.py pi@<IP_RPI>:~/
scp parking_setup_v2.html pi@<IP_RPI>:~/
scp yolov8s_visdrone_320.onnx pi@<IP_RPI>:~/
```

### Structure des fichiers sur le RPi

```
~/
├── parking_setup_server_v2.py      # Serveur Flask principal
├── parking_setup_v2.html           # Interface web
├── yolov8s_visdrone_320.onnx       # Modèle YOLO (VisDrone, small, 320x320)
├── cameras.json                    # Config caméras (auto-généré)
├── settings.json                   # Réglages persistants (auto-généré)
├── parking_coords_*.json           # Masques de places (1 par image/caméra)
├── sensor_places_*.json            # Flags places capteur (auto-généré)
└── capture_*.jpg                   # Screenshots des caméras
```

---

## Service systemd

### Créer le service

```bash
sudo nano /etc/systemd/system/SystemVision.service
```

```ini
[Unit]
Description=Parking Vision System
After=network.target

[Service]
Type=simple
User=pi
WorkingDirectory=/home/pi
ExecStart=/usr/bin/python3 /home/pi/parking_setup_server_v2.py
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

### Activer et démarrer

```bash
sudo systemctl daemon-reload
sudo systemctl enable SystemVision
sudo systemctl start SystemVision
```

### Commandes utiles

```bash
sudo systemctl status SystemVision        # Statut
sudo systemctl restart SystemVision       # Redémarrer
sudo systemctl stop SystemVision          # Arrêter
journalctl -u SystemVision -f             # Logs en temps réel
journalctl -u SystemVision -f | grep YOLO # Logs YOLO
journalctl -u SystemVision -f | grep XBEE # Logs XBee
```

---

## Accès à l'interface

Depuis un navigateur sur le même réseau :

```
http://<IP_RPI>:5000
```

L'interface comporte 3 onglets :
- **Éditeur de places** — tracer les polygones des places sur une image
- **Live View** — flux en direct avec détection temps réel
- **Démo vidéo** — tester avec un fichier vidéo local

---

## Configuration des caméras

### Depuis l'interface

Onglet Live View → section Caméra → Ajouter/Modifier.

Champs requis : nom, IP, port (554), chemin RTSP, identifiants.

Le bouton **Tester** vérifie la connexion en 3 étapes :
1. IP:port joignable ?
2. Connexion RTSP OK ?
3. Image reçue ?

### Trouver le chemin RTSP

Selon la marque de caméra :
- **Dahua** : `cam/realmonitor?channel=1&subtype=1`
- **Hikvision** : `Streaming/Channels/102`
- **Générique ONVIF** : `h264Preview_01_sub` (sub-stream) ou `h264Preview_01_main` (main)

Privilégier le sub-stream (résolution plus basse, moins de charge CPU).

---

## Éditeur de places

### Workflow

1. Sélectionner la caméra
2. Capturer un screenshot ou choisir une image existante
3. Tracer les places (mode manuel ou séparateurs)
4. Marquer les places capteur si nécessaire (bouton "Capteur")
5. Sauvegarder
6. Cliquer **★ Actif** pour définir ce masque comme actif pour le live

### Modes de tracé

- **Manuel** — cliquer 4 coins pour chaque place
- **Séparateurs** — tracer des lignes de séparation, les places sont générées entre les lignes
- **Éditer** — sélectionner une place, déplacer ses coins, supprimer, marquer comme capteur

### Masques par image

Chaque image a son propre masque. On peut avoir plusieurs images (angles) pour la même caméra avec des masques différents. Le bouton **★ Actif** détermine lequel est utilisé pour le live.

### Places capteur

Les places marquées "capteur" (badge CAP, affichage gris en pointillés) sont exclues de la détection YOLO et du comptage. Elles sont gérées par un capteur externe.

---

## Live View

### Contrôles

- **Démarrer/Arrêter** le flux
- **Zoom/Pan** (molette + drag)
- **Plein écran**
- **Toggle YOLO** — activer/désactiver la détection
- **Toggle Masque** — activer/désactiver l'affichage des places
- **Point d'ancrage vertical** — ajuster où sur le véhicule le point de détection se situe (85% = bas)
- **Point d'ancrage horizontal** — gauche/droite pour places en biais
- **Lissage** — fenêtre de vote (3-30 frames), plus haut = plus stable

### Barre de statut (bas de page)

Toujours visible, affiche :
- **YOLO** — temps moyen de détection (ms)
- **Frame** — temps total de traitement par frame (ms)
- **CPU** — température du processeur (vert < 60°C, jaune < 75°C, rouge > 75°C)
- **Flux** — état : OK / Image noire / Image figée / Reconnexion
- **XBee** — Actif / Off

### Détection santé caméra

Le système vérifie périodiquement :
- **Image noire** (luminosité < 8) → caméra tombée, câble débranché
- **Image figée** (différence entre frames < 0.5) → flux bloqué

### Reconnexion automatique

Si le flux RTSP est perdu, le système tente automatiquement de se reconnecter toutes les 3 secondes.

---

## Réglages avancés

Accessibles depuis l'onglet Live → bouton "Réglages avancés".

| Paramètre | Défaut | Description |
|-----------|--------|-------------|
| Confiance YOLO | 0.25 | Seuil de confiance minimum pour une détection |
| NMS | 0.45 | Seuil de suppression des doublons |
| FPS stream | 12 | Images par seconde du flux web |
| Fréquence YOLO | 6 | Exécuter YOLO toutes les N frames |
| Qualité JPEG | 80 | Compression du flux (30-100) |
| Seuil occupation | 0.6 | % de votes pour considérer une place occupée |

Tous les réglages sont persistés dans `settings.json`.

---

## XBee / LoRa

### Configuration matérielle

Module XBee branché en USB sur le Raspberry Pi. Port par défaut : `/dev/ttyUSB0`.

Vérifier le port :
```bash
ls /dev/ttyUSB*
dmesg | grep ttyUSB
```

### Configuration logicielle

Onglet Live → Réglages avancés → section XBee/LoRa :
- **Toggle** — activer/désactiver l'envoi
- **Nom de zone** — identifiant de la zone (ex: "Z")
- **Port série** — `/dev/ttyUSB0`
- **Baud rate** — 115200
- **Intervalle** — 30 secondes

### Format des données

Le XBee envoie toutes les 30 secondes un JSON sur le port série :

```json
{"zone":"Z","nb_places_libres":12,"nb_places_total":20,"device":"camera"}
```

En cas de perte du flux caméra :

```json
{"zone":"Z","nb_places_libres":-1,"nb_places_total":-1,"device":"camera"}
```

Le timestamp est géré côté broker, pas côté RPi.

### Vérification

```bash
journalctl -u SystemVision -f | grep XBEE
```

Doit afficher :
```
[XBEE] Démarré sur /dev/ttyUSB0 @ 115200 baud
[XBEE] Envoyé : {"zone":"Z","nb_places_libres":3,"nb_places_total":46,"device":"camera"}
```

---

## Déploiement / Mise à jour

### Copier les fichiers

```bash
scp parking_setup_server_v2.py pi@<IP_RPI>:~/
scp parking_setup_v2.html pi@<IP_RPI>:~/
```

### Redémarrer le service

```bash
sudo systemctl restart SystemVision
```

### Réinitialiser les settings

Si de nouveaux paramètres ont été ajoutés, supprimer `settings.json` pour régénérer avec les nouvelles valeurs par défaut :

```bash
rm ~/settings.json
sudo systemctl restart SystemVision
```

---

## Performance sur RPi 4

- **Modèle YOLO** : YOLOv8s VisDrone 320x320
- **Temps de détection** : ~400ms par inférence
- **Avec `process_every=6` à 12fps** : 1 inférence toutes les 500ms → le RPi suit
- **Thread YOLO dédié** : l'inférence tourne en parallèle du streaming
- **Température** : surveiller via la barre de statut, throttle à 80°C

### Optimisations en place

- Post-traitement vectorisé (numpy)
- Thread YOLO asynchrone séparé du rendu
- Thread de capture séparé (pas de lag sur la lecture RTSP)
- Encodage JPEG parallèle
- Rechargement automatique des masques sans redémarrage

---

## Dépannage

| Problème | Solution |
|----------|----------|
| Interface inaccessible | Vérifier que le service tourne : `systemctl status SystemVision` |
| YOLO non disponible | Vérifier que `yolov8s_visdrone_320.onnx` est dans `~/` |
| Flux noir | Vérifier IP/identifiants de la caméra, tester avec le bouton "Tester" |
| XBee ne démarre pas | `pip install pyserial --break-system-packages` + vérifier `/dev/ttyUSB0` |
| 0.0.0.0 reçu côté XBee | Vérifier le baud rate (115200) et le mode du XBee |
| Température élevée | Réduire `stream_fps` ou augmenter `process_every` |
| Masque "aucun" en live | Définir un masque actif dans l'éditeur (bouton ★ Actif) |
| Places non comptées | Vérifier qu'elles ne sont pas marquées "capteur" |
