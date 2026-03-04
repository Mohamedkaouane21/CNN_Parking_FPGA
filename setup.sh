#!/bin/bash
# Migration script: ancienne structure (~/flat) → nouvelle (~parking/)
# Usage: bash setup.sh

set -e
PARKING_DIR="$HOME/parking"

echo "=== Setup Parking Vision ==="
echo "Dossier: $PARKING_DIR"

# Créer l'arborescence
mkdir -p "$PARKING_DIR"/{data/coords,data/sensors,captures,models,videos,parking_ui}

# Déplacer le serveur
[ -f "$HOME/parking_setup_server_v2.py" ] && mv "$HOME/parking_setup_server_v2.py" "$PARKING_DIR/parking_server.py" 2>/dev/null || true
[ -f "$HOME/parking_server.py" ] && mv "$HOME/parking_server.py" "$PARKING_DIR/parking_server.py" 2>/dev/null || true

# Déplacer l'UI
[ -d "$HOME/parking_ui" ] && cp -r "$HOME/parking_ui"/* "$PARKING_DIR/parking_ui/" && rm -rf "$HOME/parking_ui" 2>/dev/null || true

# Déplacer les captures
for f in "$HOME"/capture_*.{jpg,jpeg,png} "$HOME"/frame_*.{jpg,jpeg,png} "$HOME"/IMG_*.{jpg,jpeg,png} "$HOME"/Test*.{png,jpg}; do
  [ -f "$f" ] && mv "$f" "$PARKING_DIR/captures/" 2>/dev/null || true
done

# Déplacer les masques
for f in "$HOME"/parking_coords_*.json; do
  [ -f "$f" ] && mv "$f" "$PARKING_DIR/data/coords/" 2>/dev/null || true
done

# Déplacer les sensors
for f in "$HOME"/sensor_places_*.json; do
  [ -f "$f" ] && mv "$f" "$PARKING_DIR/data/sensors/" 2>/dev/null || true
done

# Déplacer le modèle YOLO
for f in "$HOME"/*.onnx; do
  [ -f "$f" ] && mv "$f" "$PARKING_DIR/models/" 2>/dev/null || true
done

# Déplacer les vidéos
for f in "$HOME"/*.{mp4,avi,mkv}; do
  [ -f "$f" ] && mv "$f" "$PARKING_DIR/videos/" 2>/dev/null || true
done

# Déplacer cameras.json et settings.json
[ -f "$HOME/cameras.json" ] && mv "$HOME/cameras.json" "$PARKING_DIR/data/" 2>/dev/null || true
[ -f "$HOME/settings.json" ] && mv "$HOME/settings.json" "$PARKING_DIR/data/" 2>/dev/null || true

# Mettre à jour le service systemd
echo ""
echo "=== Mise à jour du service systemd ==="
sudo tee /etc/systemd/system/SystemVision.service > /dev/null << EOF
[Unit]
Description=Parking Vision System
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$PARKING_DIR
ExecStart=/usr/bin/python3 $PARKING_DIR/parking_server.py
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl restart SystemVision

echo ""
echo "=== Migration terminée ==="
echo "Arborescence:"
find "$PARKING_DIR" -maxdepth 3 -not -path '*/\.*' | head -30
echo ""
echo "Service: $(sudo systemctl is-active SystemVision)"
