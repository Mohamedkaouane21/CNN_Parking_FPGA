"""
export_weights_h.py - Genere weights.h et weights2.h depuis le modele Keras

Ces headers contiennent les poids Conv1 et Conv2 en constantes C float32,
utilises par les kernels HLS (conv1_pool1.cpp et conv2_pool2.cpp).

Convention Keras : W[KH][KW][IN_C][OUT_C]

Usage :
  python export_weights_h.py --model /output/models/parking_cnn.h5 \
                              --out-dir /app/hls
"""
from __future__ import annotations

import argparse
import logging
import sys
from pathlib import Path

import numpy as np
from tensorflow.keras.models import load_model

logger = logging.getLogger("export_weights_h")


def configure_logging() -> None:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        datefmt="%Y-%m-%dT%H:%M:%S",
        stream=sys.stdout,
    )


def format_float(v: float) -> str:
    """Formate un float pour litteral C (suffixe 'f')."""
    return f"{v:.8f}f"


def write_weights_h(
    w: np.ndarray,
    b: np.ndarray,
    path: Path,
    guard: str,
    w_name: str,
    b_name: str,
    prefix: str = "",
    kh_def: str = "KH",
    kw_def: str = "KW",
    inc_def: str = "IN_C",
    outc_def: str = "OUT_C",
) -> None:
    """Ecrit un header C avec les poids et biais d'une couche de convolution."""
    if w.ndim != 4:
        raise ValueError(f"Attendu W 4D (KH,KW,IN_C,OUT_C), recu shape={w.shape}")
    if b.ndim != 1 or b.shape[0] != w.shape[3]:
        raise ValueError(
            f"Biais shape={b.shape} incompatible avec W shape={w.shape}",
        )

    kh, kw, in_c, out_c = w.shape
    path.parent.mkdir(parents=True, exist_ok=True)

    with path.open("w", encoding="utf-8") as f:
        f.write(f"#ifndef {guard}\n#define {guard}\n\n")
        f.write("// Poids generes automatiquement par export_weights_h.py\n")
        f.write(
            f"// Convention TF/Keras : {w_name}"
            f"[{kh_def}][{kw_def}][{inc_def}][{outc_def}]\n\n"
        )

        f.write(f"#define {prefix}{kh_def}    {kh}\n")
        f.write(f"#define {prefix}{kw_def}    {kw}\n")
        f.write(f"#define {prefix}{inc_def}  {in_c}\n")
        f.write(f"#define {prefix}{outc_def} {out_c}\n\n")

        f.write(
            f"static const float {w_name}"
            f"[{prefix}{kh_def}][{prefix}{kw_def}]"
            f"[{prefix}{inc_def}][{prefix}{outc_def}] = {{\n"
        )

        for ky in range(kh):
            f.write(f"  // ky={ky}\n  {{\n")
            for kx in range(kw):
                f.write(f"    // kx={kx}\n    {{\n")
                for ic in range(in_c):
                    vals = ", ".join(
                        format_float(w[ky, kx, ic, oc]) for oc in range(out_c)
                    )
                    comma = "," if ic < in_c - 1 else ""
                    f.write(f"      {{ {vals} }}{comma}\n")
                comma = "," if kx < kw - 1 else ""
                f.write(f"    }}{comma}\n")
            comma = "," if ky < kh - 1 else ""
            f.write(f"  }}{comma}\n")

        f.write("};\n\n")

        vals = ", ".join(format_float(b[i]) for i in range(len(b)))
        f.write(
            f"static const float {b_name}[{prefix}{outc_def}] = {{\n"
            f"  {vals}\n}};\n\n"
        )

        f.write(f"#endif // {guard}\n")

    logger.info("  %s  W=%s  B=%s", path, w.shape, b.shape)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Export poids Keras vers headers C pour HLS",
    )
    parser.add_argument("--model", default="/output/models/parking_cnn.h5")
    parser.add_argument("--out-dir", default="/app/hls")
    return parser.parse_args()


def main() -> int:
    configure_logging()
    args = parse_args()

    model_path = Path(args.model)
    out_dir = Path(args.out_dir)

    if not model_path.is_file():
        logger.error("Modele introuvable : %s", model_path)
        return 1

    model = load_model(str(model_path))

    logger.info("=" * 60)
    logger.info("  EXPORT POIDS -> .h (headers C pour HLS)")
    logger.info("=" * 60)

    conv_layers = [l for l in model.layers if "conv2d" in l.name and l.get_weights()]

    if len(conv_layers) < 2:
        logger.error("Attendu >= 2 couches conv, trouve %d", len(conv_layers))
        return 1

    w1, b1 = conv_layers[0].get_weights()
    w1 = np.asarray(w1, dtype=np.float32)
    b1 = np.asarray(b1, dtype=np.float32)
    write_weights_h(
        w1, b1,
        out_dir / "conv1_pool1" / "src" / "weights.h",
        guard="WEIGHTS_H",
        w_name="WEIGHTS",
        b_name="BIASES",
        prefix="",
        kh_def="KH", kw_def="KW", inc_def="IN_C", outc_def="OUT_C",
    )

    w2, b2 = conv_layers[1].get_weights()
    w2 = np.asarray(w2, dtype=np.float32)
    b2 = np.asarray(b2, dtype=np.float32)
    write_weights_h(
        w2, b2,
        out_dir / "conv2_pool2" / "src" / "weights2.h",
        guard="WEIGHTS2_H",
        w_name="WEIGHTS2",
        b_name="BIASES2",
        prefix="C2_",
        kh_def="KH", kw_def="KW", inc_def="IN_C", outc_def="OUT_C",
    )

    logger.info("=" * 60)
    return 0


if __name__ == "__main__":
    sys.exit(main())
