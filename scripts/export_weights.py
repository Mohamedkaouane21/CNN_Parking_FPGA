"""
export_weights.py - Export poids Keras vers .bin float32 pour la PYNQ-Z2

Fichiers generes (ARM) :
  weights3_from_hls.bin / biases3_from_hls.bin  -> Conv3
  03_dense_w0.bin / 03_dense_w1.bin             -> Dense1
  04_dense_1_w0.bin / 04_dense_1_w1.bin         -> Dense2

Usage :
  python export_weights.py --model /output/models/parking_cnn.h5 \
                            --out /output/weights
"""
from __future__ import annotations

import argparse
import logging
import shutil
import sys
from pathlib import Path

import numpy as np
from tensorflow.keras.models import load_model

logger = logging.getLogger("export_weights")

ALIASES: dict[str, str] = {
    "weights3_from_hls.bin": "02_conv2d_2_w0.bin",
    "biases3_from_hls.bin":  "02_conv2d_2_w1.bin",
}


def configure_logging() -> None:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        datefmt="%Y-%m-%dT%H:%M:%S",
        stream=sys.stdout,
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Export poids Keras vers .bin pour PYNQ",
    )
    parser.add_argument("--model", default="/output/models/parking_cnn.h5")
    parser.add_argument("--out", default="/output/weights")
    return parser.parse_args()


def export_layer_weights(model, out_dir: Path) -> None:
    """Exporte les poids et biais de chaque couche en float32 binaire."""
    layer_idx = 0
    for layer in model.layers:
        weights = layer.get_weights()
        if not weights:
            continue
        for j, arr in enumerate(weights):
            arr = np.asarray(arr, dtype=np.float32)
            fname = f"{layer_idx:02d}_{layer.name}_w{j}.bin"
            fpath = out_dir / fname
            arr.tofile(fpath)
            logger.info("  %-40s shape=%s", fname, arr.shape)
        layer_idx += 1


def write_aliases(out_dir: Path) -> None:
    """Cree les copies-alias attendues par parking_live.py."""
    logger.info("Alias pour parking_live.py :")
    for alias, source in ALIASES.items():
        src = out_dir / source
        dst = out_dir / alias
        if src.exists():
            shutil.copy2(src, dst)
            logger.info("  %s -> %s", source, alias)
        else:
            logger.warning("  Source introuvable : %s", source)


def main() -> int:
    configure_logging()
    args = parse_args()

    model_path = Path(args.model)
    out_dir = Path(args.out)

    if not model_path.is_file():
        logger.error("Modele introuvable : %s", model_path)
        return 1

    out_dir.mkdir(parents=True, exist_ok=True)
    model = load_model(str(model_path))

    logger.info("=" * 60)
    logger.info("  EXPORT POIDS -> .bin (float32)")
    logger.info("=" * 60)

    export_layer_weights(model, out_dir)
    write_aliases(out_dir)

    logger.info("Poids exportes dans : %s", out_dir)
    return 0


if __name__ == "__main__":
    sys.exit(main())
