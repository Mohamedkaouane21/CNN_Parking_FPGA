"""
Train a simple CNN to classify parking slots as EMPTY vs OCCUPIED.

✅ No hard-coded paths:
- Provide dataset paths via CLI arguments, or use the default project structure:
    data/empty/
    data/occupied/

Example:
  python emptyparkingspotdetectionmodel.py --data-dir data --out models/parking_cnn.h5

Notes:
- This script trains a *binary classifier on slot crops* (48x48 grayscale).
- It does NOT detect slot polygons. Polygons are handled in the labeling + inference scripts.
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


IMG_SIZE = (48, 48)  # (w, h) or (h,w) depending; we'll keep (48,48)
SEED = 42


def project_root() -> Path:
    return Path(__file__).resolve().parent


def resolve_path(p: str | Path) -> Path:
    p = Path(p)
    return p if p.is_absolute() else (project_root() / p).resolve()


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
        Input(shape=(IMG_SIZE[1], IMG_SIZE[0], 1)),  # (H,W,1)
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
    parser = argparse.ArgumentParser(description="Train CNN: EMPTY vs OCCUPIED (no hard-coded paths).")
    parser.add_argument("--data-dir", default="data", help="Base dataset directory containing empty/ and occupied/.")
    parser.add_argument("--empty-dir", default=None, help="Override path to empty/ folder.")
    parser.add_argument("--occupied-dir", default=None, help="Override path to occupied/ folder.")
    parser.add_argument("--out", default="models/parking_cnn.h5", help="Output .h5 model path.")
    parser.add_argument("--epochs", type=int, default=25)
    parser.add_argument("--batch-size", type=int, default=32)
    parser.add_argument("--val-split", type=float, default=0.2)
    args = parser.parse_args()

    data_dir = resolve_path(args.data_dir)
    empty_dir = resolve_path(args.empty_dir) if args.empty_dir else (data_dir / "empty").resolve()
    occupied_dir = resolve_path(args.occupied_dir) if args.occupied_dir else (data_dir / "occupied").resolve()

    out_path = resolve_path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)

    # Load dataset
    empty_imgs, empty_labels = load_images_from_folder(empty_dir, label=0)
    occ_imgs, occ_labels = load_images_from_folder(occupied_dir, label=1)

    X = np.array(empty_imgs + occ_imgs, dtype=np.float32)
    y = np.array(empty_labels + occ_labels, dtype=np.int64)

    if len(X) == 0:
        raise RuntimeError("No images found. Put images in data/empty and data/occupied or pass --empty-dir/--occupied-dir.")

    # Normalize + reshape to (N,H,W,1)
    X = (X / 255.0).reshape((-1, IMG_SIZE[1], IMG_SIZE[0], 1))
    y = to_categorical(y, num_classes=2)

    # Shuffle
    rng = np.random.default_rng(SEED)
    idx = rng.permutation(len(X))
    X, y = X[idx], y[idx]

    # Split
    split = int(len(X) * (1 - args.val_split))
    X_train, X_val = X[:split], X[split:]
    y_train, y_val = y[:split], y[split:]

    print("============================================================")
    print("TRAINING CNN (EMPTY vs OCCUPIED)")
    print("============================================================")
    print(f"Empty dir:     {empty_dir}")
    print(f"Occupied dir:  {occupied_dir}")
    print(f"Images total:  {len(X)} (train={len(X_train)} val={len(X_val)})")
    print(f"Output model:  {out_path}")
    print("------------------------------------------------------------")

    model = build_model()
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
    print(f"Saved model to: {out_path}")


if __name__ == "__main__":
    main()
