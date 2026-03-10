"""
export_weights.py — Export poids Keras → .bin float32 pour la PYNQ-Z2

Fichiers générés (ARM) :
  weights3_from_hls.bin / biases3_from_hls.bin  → Conv3
  03_dense_w0.bin / 03_dense_w1.bin             → Dense1
  04_dense_1_w0.bin / 04_dense_1_w1.bin         → Dense2

Usage :
  python export_weights.py --model /output/models/parking_cnn.h5 --out /output/weights
"""
from __future__ import annotations

import argparse
import os
import shutil

import numpy as np
from tensorflow.keras.models import load_model


def main() -> None:
    parser = argparse.ArgumentParser(description="Export poids Keras → .bin pour PYNQ")
    parser.add_argument("--model", default="/output/models/parking_cnn.h5")
    parser.add_argument("--out", default="/output/weights")
    args = parser.parse_args()

    os.makedirs(args.out, exist_ok=True)
    model = load_model(args.model)

    print("=" * 60)
    print("  EXPORT POIDS → .bin (float32)")
    print("=" * 60)

    i = 0
    for layer in model.layers:
        w = layer.get_weights()
        if not w:
            continue
        for j, arr in enumerate(w):
            arr = np.asarray(arr, dtype=np.float32)
            fname = f"{i:02d}_{layer.name}_w{j}.bin"
            fpath = os.path.join(args.out, fname)
            arr.tofile(fpath)
            print(f"  {fname:40s}  shape={arr.shape}")
        i += 1

    # Alias pour parking_live.py
    aliases = {
        "weights3_from_hls.bin": "02_conv2d_2_w0.bin",
        "biases3_from_hls.bin":  "02_conv2d_2_w1.bin",
    }
    print("\n  Alias pour parking_live.py :")
    for alias, source in aliases.items():
        src = os.path.join(args.out, source)
        dst = os.path.join(args.out, alias)
        if os.path.exists(src):
            shutil.copy2(src, dst)
            print(f"    {source} → {alias}")
        else:
            print(f"    ⚠️  {source} introuvable")

    print(f"\n✅ Poids exportés dans : {args.out}")


if __name__ == "__main__":
    main()
