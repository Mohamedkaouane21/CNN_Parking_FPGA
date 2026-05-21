"""
regen_golden.py - Genere les donnees de test (golden) pour les testbenches HLS

Extrait les activations intermediaires du modele Keras pour produire :
  - conv1_pool1/data/input_48x48.bin   : entree 48x48 normalisee
  - conv1_pool1/data/golden_pool1.bin  : sortie attendue apres conv1+pool1 (16x23x23)
  - conv2_pool2/data/input_pool1.bin   : = golden_pool1 (entree de conv2)
  - conv2_pool2/data/golden_pool2.bin  : sortie attendue apres conv2+pool2 (32x10x10)

Les fichiers sont en float32, channel-first (C, H, W) pour correspondre
a l'ordre memoire des kernels HLS.

Usage :
  python regen_golden.py --model /output/models/parking_cnn.h5 \
                          --image /data/dataset/occupied/some_image.jpg \
                          --out-dir /app/hls
"""
from __future__ import annotations

import argparse
import logging
import sys
from pathlib import Path

import cv2
import numpy as np
from tensorflow.keras.models import load_model

logger = logging.getLogger("regen_golden")

IMG_SIZE: tuple[int, int] = (48, 48)
VALID_EXTS: frozenset[str] = frozenset({".jpg", ".jpeg", ".png", ".bmp"})


def configure_logging() -> None:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        datefmt="%Y-%m-%dT%H:%M:%S",
        stream=sys.stdout,
    )


def find_test_image(data_dir: Path) -> Path:
    """Trouve la premiere image valide dans data_dir/{occupied,empty}."""
    if not data_dir.exists():
        raise FileNotFoundError(f"Dataset introuvable : {data_dir}")

    for subdir in ("occupied", "empty"):
        candidate_dir = data_dir / subdir
        if not candidate_dir.is_dir():
            continue
        for f in sorted(candidate_dir.iterdir()):
            if f.suffix.lower() in VALID_EXTS:
                return f
    raise FileNotFoundError(f"Aucune image trouvee dans {data_dir}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Genere golden pour HLS testbenches",
    )
    parser.add_argument("--model", default="/output/models/parking_cnn.h5")
    parser.add_argument(
        "--image", default=None,
        help="Image de test 48x48 (si omis, prend la 1ere du dataset)",
    )
    parser.add_argument(
        "--data-dir", default="/data/dataset",
        help="Repertoire dataset pour trouver une image auto",
    )
    parser.add_argument(
        "--out-dir", default="/app/hls",
        help="Repertoire racine HLS",
    )
    return parser.parse_args()


def main() -> int:
    configure_logging()
    args = parse_args()

    if args.image:
        img_path = Path(args.image)
        if not img_path.is_file():
            logger.error("Image introuvable : %s", img_path)
            return 1
    else:
        img_path = find_test_image(Path(args.data_dir))

    logger.info("Image de test : %s", img_path)

    img = cv2.imread(str(img_path), cv2.IMREAD_GRAYSCALE)
    if img is None:
        logger.error("Impossible de lire : %s", img_path)
        return 1
    img = cv2.resize(img, IMG_SIZE, interpolation=cv2.INTER_AREA).astype(np.float32) / 255.0
    x = img.reshape(1, IMG_SIZE[1], IMG_SIZE[0], 1)

    model_path = Path(args.model)
    if not model_path.is_file():
        logger.error("Modele introuvable : %s", model_path)
        return 1
    model = load_model(str(model_path))

    pool_outputs: list[np.ndarray] = []
    h = x
    for layer in model.layers:
        h = layer(h)
        if "max_pooling" in layer.name.lower():
            pool_outputs.append(h.numpy() if hasattr(h, "numpy") else np.asarray(h))

    if len(pool_outputs) < 2:
        logger.error(
            "Attendu >= 2 couches MaxPooling, trouve %d", len(pool_outputs),
        )
        return 1

    out_pool1 = pool_outputs[0][0]  # (23, 23, 16) Keras NHWC
    out_pool2 = pool_outputs[1][0]  # (10, 10, 32) Keras NHWC

    out_pool1_chf = np.transpose(out_pool1, (2, 0, 1)).astype(np.float32)  # (16, 23, 23)
    out_pool2_chf = np.transpose(out_pool2, (2, 0, 1)).astype(np.float32)  # (32, 10, 10)

    logger.info("  pool1 : %s -> channel-first %s", out_pool1.shape, out_pool1_chf.shape)
    logger.info("  pool2 : %s -> channel-first %s", out_pool2.shape, out_pool2_chf.shape)

    out_dir = Path(args.out_dir)
    conv1_data = out_dir / "conv1_pool1" / "data"
    conv2_data = out_dir / "conv2_pool2" / "data"
    conv1_data.mkdir(parents=True, exist_ok=True)
    conv2_data.mkdir(parents=True, exist_ok=True)

    input_path = conv1_data / "input_48x48.bin"
    golden1_path = conv1_data / "golden_pool1.bin"
    img.flatten().astype(np.float32).tofile(input_path)
    out_pool1_chf.flatten().tofile(golden1_path)
    logger.info("  %s  (%d floats)", input_path, IMG_SIZE[0] * IMG_SIZE[1])
    logger.info("  %s  (%d floats)", golden1_path, out_pool1_chf.size)

    input2_path = conv2_data / "input_pool1.bin"
    golden2_path = conv2_data / "golden_pool2.bin"
    out_pool1_chf.flatten().tofile(input2_path)
    out_pool2_chf.flatten().tofile(golden2_path)
    logger.info("  %s  (%d floats)", input2_path, out_pool1_chf.size)
    logger.info("  %s  (%d floats)", golden2_path, out_pool2_chf.size)

    logger.info("Golden generes avec succes.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
