"""
train.py - Entrainement CNN parking (EMPTY vs OCCUPIED)

Architecture :
  Conv2D(16) - MaxPool - Conv2D(32) - MaxPool - Conv2D(64)
  - Flatten - Dropout - Dense(128) - Dropout - Dense(2, softmax)

Input  : images 48x48 grayscale
Output : models/parking_cnn.h5

Usage :
  python train.py --data-dir /data/dataset --out /output/models/parking_cnn.h5
"""
from __future__ import annotations

import argparse
import logging
import random
import sys
from pathlib import Path

import cv2
import numpy as np
import tensorflow as tf
from tensorflow.keras.callbacks import EarlyStopping
from tensorflow.keras.layers import (
    Conv2D,
    Dense,
    Dropout,
    Flatten,
    Input,
    MaxPooling2D,
)
from tensorflow.keras.models import Sequential
from tensorflow.keras.utils import to_categorical

IMG_SIZE: tuple[int, int] = (48, 48)
SEED: int = 42
VALID_EXTS: frozenset[str] = frozenset({".jpg", ".jpeg", ".png", ".bmp"})

logger = logging.getLogger("train")


def configure_logging() -> None:
    """Configure le logger root au format ISO."""
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        datefmt="%Y-%m-%dT%H:%M:%S",
        stream=sys.stdout,
    )


def set_global_seeds(seed: int) -> None:
    """Fixe les seeds Python / NumPy / TensorFlow pour reproductibilite."""
    random.seed(seed)
    np.random.seed(seed)
    tf.random.set_seed(seed)


def load_images_from_folder(
    folder: Path, label: int
) -> tuple[list[np.ndarray], list[int]]:
    """Charge les images grayscale d'un dossier, redimensionne en IMG_SIZE."""
    if not folder.exists():
        raise FileNotFoundError(f"Folder not found: {folder}")
    if not folder.is_dir():
        raise NotADirectoryError(f"Not a directory: {folder}")

    images: list[np.ndarray] = []
    labels: list[int] = []
    skipped = 0

    for img_path in sorted(folder.iterdir()):
        if img_path.suffix.lower() not in VALID_EXTS:
            continue
        img = cv2.imread(str(img_path), cv2.IMREAD_GRAYSCALE)
        if img is None:
            logger.warning("Skipped unreadable image: %s", img_path)
            skipped += 1
            continue
        img = cv2.resize(img, IMG_SIZE, interpolation=cv2.INTER_AREA)
        images.append(img)
        labels.append(label)

    logger.info(
        "Loaded %d images from %s (label=%d, skipped=%d)",
        len(images), folder, label, skipped,
    )
    return images, labels


def build_model() -> Sequential:
    """Construit le CNN Smart Parking."""
    model = Sequential([
        Input(shape=(IMG_SIZE[1], IMG_SIZE[0], 1)),
        Conv2D(16, (3, 3), activation="relu"),
        MaxPooling2D((2, 2)),
        Conv2D(32, (3, 3), activation="relu"),
        MaxPooling2D((2, 2)),
        Conv2D(64, (3, 3), activation="relu"),
        Flatten(),
        Dropout(0.25),
        Dense(128, activation="relu"),
        Dropout(0.25),
        Dense(2, activation="softmax"),
    ])
    model.compile(
        optimizer="adam",
        loss="categorical_crossentropy",
        metrics=["accuracy"],
    )
    return model


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Train CNN: EMPTY vs OCCUPIED",
    )
    parser.add_argument(
        "--data-dir", default="/data/dataset",
        help="Repertoire contenant empty/ et occupied/",
    )
    parser.add_argument(
        "--empty-dir", default=None,
        help="Override chemin vers empty/",
    )
    parser.add_argument(
        "--occupied-dir", default=None,
        help="Override chemin vers occupied/",
    )
    parser.add_argument(
        "--out", default="/output/models/parking_cnn.h5",
        help="Chemin du modele .h5 en sortie",
    )
    parser.add_argument("--epochs", type=int, default=25)
    parser.add_argument("--batch-size", type=int, default=32)
    parser.add_argument("--val-split", type=float, default=0.2)
    return parser.parse_args()


def main() -> int:
    configure_logging()
    args = parse_args()

    if not 0.0 < args.val_split < 1.0:
        logger.error("--val-split doit etre dans (0, 1), recu %s", args.val_split)
        return 2
    if args.epochs <= 0 or args.batch_size <= 0:
        logger.error("--epochs et --batch-size doivent etre > 0")
        return 2

    set_global_seeds(SEED)

    data_dir = Path(args.data_dir)
    empty_dir = Path(args.empty_dir) if args.empty_dir else data_dir / "empty"
    occupied_dir = Path(args.occupied_dir) if args.occupied_dir else data_dir / "occupied"

    out_path = Path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)

    empty_imgs, empty_labels = load_images_from_folder(empty_dir, label=0)
    occ_imgs, occ_labels = load_images_from_folder(occupied_dir, label=1)

    if not empty_imgs and not occ_imgs:
        logger.error("Aucune image trouvee dans %s", data_dir)
        return 1
    if not empty_imgs or not occ_imgs:
        logger.error("Une des deux classes est vide (empty=%d, occupied=%d)",
                     len(empty_imgs), len(occ_imgs))
        return 1

    X = np.array(empty_imgs + occ_imgs, dtype=np.float32)
    y = np.array(empty_labels + occ_labels, dtype=np.int64)

    X = (X / 255.0).reshape((-1, IMG_SIZE[1], IMG_SIZE[0], 1))
    y = to_categorical(y, num_classes=2)

    rng = np.random.default_rng(SEED)
    idx = rng.permutation(len(X))
    X, y = X[idx], y[idx]

    split = int(len(X) * (1 - args.val_split))
    X_train, X_val = X[:split], X[split:]
    y_train, y_val = y[:split], y[split:]

    logger.info("=" * 60)
    logger.info("  ENTRAINEMENT CNN - PARKING (EMPTY vs OCCUPIED)")
    logger.info("=" * 60)
    logger.info("  Empty dir    : %s", empty_dir)
    logger.info("  Occupied dir : %s", occupied_dir)
    logger.info("  Images       : %d (train=%d val=%d)",
                len(X), len(X_train), len(X_val))
    logger.info("  Output       : %s", out_path)
    logger.info("  Epochs       : %d  Batch: %d", args.epochs, args.batch_size)
    logger.info("=" * 60)

    model = build_model()
    model.summary(print_fn=logger.info)

    early_stop = EarlyStopping(
        monitor="val_loss",
        patience=5,
        restore_best_weights=True,
    )

    model.fit(
        X_train, y_train,
        validation_data=(X_val, y_val),
        epochs=args.epochs,
        batch_size=args.batch_size,
        callbacks=[early_stop],
        verbose=1,
    )

    model.save(str(out_path))
    logger.info("Modele sauvegarde : %s", out_path)
    return 0


if __name__ == "__main__":
    sys.exit(main())
