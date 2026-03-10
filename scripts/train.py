"""
train.py — Entraînement CNN parking (EMPTY vs OCCUPIED)

Architecture :
  Conv2D(16) → MaxPool → Conv2D(32) → MaxPool → Conv2D(64)
  → Flatten → Dropout → Dense(128) → Dropout → Dense(2, softmax)

Input : images 48×48 grayscale
Output : models/parking_cnn.h5

Usage :
  python train.py --data-dir /data/dataset --out /output/models/parking_cnn.h5
"""
from __future__ import annotations

import argparse
from pathlib import Path
import sys

import numpy as np
import cv2
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, Dropout, Input
from tensorflow.keras.utils import to_categorical
from tensorflow.keras.callbacks import EarlyStopping


IMG_SIZE = (48, 48)
SEED = 42


def load_images_from_folder(folder: Path, label: int) -> tuple[list[np.ndarray], list[int]]:
    images: list[np.ndarray] = []
    labels: list[int] = []

    if not folder.exists():
        raise FileNotFoundError(f"Folder not found: {folder}")

    for img_path in sorted(folder.glob("*")):
        if img_path.suffix.lower() not in {".jpg", ".jpeg", ".png", ".bmp"}:
            continue
        img = cv2.imread(str(img_path), cv2.IMREAD_GRAYSCALE)
        if img is None:
            print(f"⚠️ Skipped unreadable image: {img_path}", file=sys.stderr)
            continue
        img = cv2.resize(img, IMG_SIZE)
        images.append(img)
        labels.append(label)

    return images, labels


def build_model() -> Sequential:
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
    model.compile(optimizer="adam", loss="categorical_crossentropy", metrics=["accuracy"])
    return model


def main() -> None:
    parser = argparse.ArgumentParser(description="Train CNN: EMPTY vs OCCUPIED")
    parser.add_argument("--data-dir", default="/data/dataset",
                        help="Répertoire contenant empty/ et occupied/")
    parser.add_argument("--empty-dir", default=None,
                        help="Override chemin vers empty/")
    parser.add_argument("--occupied-dir", default=None,
                        help="Override chemin vers occupied/")
    parser.add_argument("--out", default="/output/models/parking_cnn.h5",
                        help="Chemin du modèle .h5 en sortie")
    parser.add_argument("--epochs", type=int, default=25)
    parser.add_argument("--batch-size", type=int, default=32)
    parser.add_argument("--val-split", type=float, default=0.2)
    args = parser.parse_args()

    data_dir = Path(args.data_dir)
    empty_dir = Path(args.empty_dir) if args.empty_dir else data_dir / "empty"
    occupied_dir = Path(args.occupied_dir) if args.occupied_dir else data_dir / "occupied"

    out_path = Path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)

    empty_imgs, empty_labels = load_images_from_folder(empty_dir, label=0)
    occ_imgs, occ_labels = load_images_from_folder(occupied_dir, label=1)

    X = np.array(empty_imgs + occ_imgs, dtype=np.float32)
    y = np.array(empty_labels + occ_labels, dtype=np.int64)

    if len(X) == 0:
        raise RuntimeError("Aucune image trouvée.")

    X = (X / 255.0).reshape((-1, IMG_SIZE[1], IMG_SIZE[0], 1))
    y = to_categorical(y, num_classes=2)

    rng = np.random.default_rng(SEED)
    idx = rng.permutation(len(X))
    X, y = X[idx], y[idx]

    split = int(len(X) * (1 - args.val_split))
    X_train, X_val = X[:split], X[split:]
    y_train, y_val = y[:split], y[split:]

    print("=" * 60)
    print("  ENTRAINEMENT CNN — PARKING (EMPTY vs OCCUPIED)")
    print("=" * 60)
    print(f"  Empty dir    : {empty_dir}")
    print(f"  Occupied dir : {occupied_dir}")
    print(f"  Images       : {len(X)} (train={len(X_train)} val={len(X_val)})")
    print(f"  Output       : {out_path}")
    print(f"  Epochs       : {args.epochs}  Batch: {args.batch_size}")
    print("=" * 60)

    model = build_model()
    model.summary()

    es = EarlyStopping(monitor="val_loss", patience=5, restore_best_weights=True)

    model.fit(
        X_train, y_train,
        validation_data=(X_val, y_val),
        epochs=args.epochs,
        batch_size=args.batch_size,
        callbacks=[es],
        verbose=1,
    )

    model.save(str(out_path))
    print(f"\n✅ Modèle sauvegardé : {out_path}")


if __name__ == "__main__":
    main()
