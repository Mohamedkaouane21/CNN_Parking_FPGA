"""
regen_golden.py — Génère les données de test (golden) pour les testbenches HLS

Extrait les activations intermédiaires du modèle Keras pour produire :
  - conv1_pool1/data/input_48x48.bin   : entrée 48×48 normalisée
  - conv1_pool1/data/golden_pool1.bin  : sortie attendue après conv1+pool1 (16×23×23)
  - conv2_pool2/data/input_pool1.bin   : = golden_pool1 (entrée de conv2)
  - conv2_pool2/data/golden_pool2.bin  : sortie attendue après conv2+pool2 (32×10×10)

Les fichiers sont en float32, channel-first (C, H, W) pour correspondre
à l'ordre mémoire des kernels HLS.

Usage :
  python regen_golden.py --model /output/models/parking_cnn.h5 \
                          --image /data/dataset/occupied/some_image.jpg \
                          --out-dir /app/hls
"""
from __future__ import annotations

import argparse
import glob
import os

import cv2
import numpy as np
from tensorflow.keras.models import load_model


def find_test_image(data_dir: str) -> str:
    """Trouve une image de test dans le dataset."""
    for subdir in ["occupied", "empty"]:
        pattern = os.path.join(data_dir, subdir, "*")
        for f in sorted(glob.glob(pattern)):
            if f.lower().endswith((".jpg", ".jpeg", ".png", ".bmp")):
                return f
    raise FileNotFoundError(f"Aucune image trouvée dans {data_dir}")


def main() -> None:
    parser = argparse.ArgumentParser(description="Génère golden pour HLS testbenches")
    parser.add_argument("--model", default="/output/models/parking_cnn.h5")
    parser.add_argument("--image", default=None,
                        help="Image de test 48×48 (si omis, prend la 1ère du dataset)")
    parser.add_argument("--data-dir", default="/data/dataset",
                        help="Répertoire dataset pour trouver une image auto")
    parser.add_argument("--out-dir", default="/app/hls",
                        help="Répertoire racine HLS")
    args = parser.parse_args()

    # Trouver une image de test
    if args.image:
        img_path = args.image
    else:
        img_path = find_test_image(args.data_dir)
    print(f"Image de test : {img_path}")

    # Charger et préparer l'image
    img = cv2.imread(img_path, cv2.IMREAD_GRAYSCALE)
    if img is None:
        raise FileNotFoundError(f"Impossible de lire : {img_path}")
    img = cv2.resize(img, (48, 48)).astype(np.float32) / 255.0
    x = img.reshape(1, 48, 48, 1)

    # Charger le modèle
    model = load_model(args.model)

    # Extraire les activations couche par couche
    # On fait passer x à travers chaque couche séquentiellement
    # et on capture les sorties après chaque MaxPooling2D
    pool_outputs = []
    h = x
    for layer in model.layers:
        h = layer(h)
        if "max_pooling" in layer.name.lower():
            pool_outputs.append(h.numpy() if hasattr(h, 'numpy') else np.array(h))

    if len(pool_outputs) < 2:
        raise RuntimeError(f"Attendu >= 2 couches MaxPooling, trouvé {len(pool_outputs)}")

    out_pool1 = pool_outputs[0][0]  # (23, 23, 16) Keras NHWC
    out_pool2 = pool_outputs[1][0]  # (10, 10, 32) Keras NHWC

    # Convertir NHWC → channel-first (C, H, W) pour les kernels HLS
    out_pool1_chf = np.transpose(out_pool1, (2, 0, 1)).astype(np.float32)  # (16, 23, 23)
    out_pool2_chf = np.transpose(out_pool2, (2, 0, 1)).astype(np.float32)  # (32, 10, 10)

    print(f"  pool1 : {out_pool1.shape} → channel-first {out_pool1_chf.shape}")
    print(f"  pool2 : {out_pool2.shape} → channel-first {out_pool2_chf.shape}")

    # Écrire les fichiers
    conv1_data = os.path.join(args.out_dir, "conv1_pool1", "data")
    conv2_data = os.path.join(args.out_dir, "conv2_pool2", "data")
    os.makedirs(conv1_data, exist_ok=True)
    os.makedirs(conv2_data, exist_ok=True)

    # Conv1 : input + golden
    input_path = os.path.join(conv1_data, "input_48x48.bin")
    golden1_path = os.path.join(conv1_data, "golden_pool1.bin")
    img.flatten().astype(np.float32).tofile(input_path)
    out_pool1_chf.flatten().tofile(golden1_path)
    print(f"  ✅ {input_path}  ({48*48} floats)")
    print(f"  ✅ {golden1_path}  ({out_pool1_chf.size} floats)")

    # Conv2 : input (= pool1 output) + golden
    input2_path = os.path.join(conv2_data, "input_pool1.bin")
    golden2_path = os.path.join(conv2_data, "golden_pool2.bin")
    out_pool1_chf.flatten().tofile(input2_path)
    out_pool2_chf.flatten().tofile(golden2_path)
    print(f"  ✅ {input2_path}  ({out_pool1_chf.size} floats)")
    print(f"  ✅ {golden2_path}  ({out_pool2_chf.size} floats)")

    print("\n✅ Golden générés avec succès.")


if __name__ == "__main__":
    main()