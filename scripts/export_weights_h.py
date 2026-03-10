"""
export_weights_h.py — Génère weights.h et weights2.h depuis le modèle Keras

Ces headers contiennent les poids Conv1 et Conv2 en constantes C float32,
utilisés par les kernels HLS (conv1_pool1.cpp et conv2_pool2.cpp).

Convention Keras : W[KH][KW][IN_C][OUT_C]

Usage :
  python export_weights_h.py --model /output/models/parking_cnn.h5 \
                              --out-dir /app/hls
"""
from __future__ import annotations

import argparse
import os

import numpy as np
from tensorflow.keras.models import load_model


def format_float(v: float) -> str:
    return f"{v:.8f}f"


def write_weights_h(w: np.ndarray, b: np.ndarray, path: str,
                    guard: str, w_name: str, b_name: str,
                    prefix: str = "", kh_def: str = "KH", kw_def: str = "KW",
                    inc_def: str = "IN_C", outc_def: str = "OUT_C") -> None:
    """Écrit un header C avec les poids et biais."""
    kh, kw, in_c, out_c = w.shape

    with open(path, "w") as f:
        f.write(f"#ifndef {guard}\n#define {guard}\n\n")
        f.write(f"// Poids générés automatiquement par export_weights_h.py\n")
        f.write(f"// Convention TF/Keras : {w_name}[{kh_def}][{kw_def}][{inc_def}][{outc_def}]\n\n")

        f.write(f"#define {prefix}{kh_def}    {kh}\n")
        f.write(f"#define {prefix}{kw_def}    {kw}\n")
        f.write(f"#define {prefix}{inc_def}  {in_c}\n")
        f.write(f"#define {prefix}{outc_def} {out_c}\n\n")

        f.write(f"static const float {w_name}[{prefix}{kh_def}][{prefix}{kw_def}]"
                f"[{prefix}{inc_def}][{prefix}{outc_def}] = {{\n")

        for ky in range(kh):
            f.write(f"  // ky={ky}\n  {{\n")
            for kx in range(kw):
                f.write(f"    // kx={kx}\n    {{\n")
                for ic in range(in_c):
                    vals = ", ".join(format_float(w[ky, kx, ic, oc]) for oc in range(out_c))
                    comma = "," if ic < in_c - 1 else ""
                    f.write(f"      {{ {vals} }}{comma}\n")
                comma = "," if kx < kw - 1 else ""
                f.write(f"    }}{comma}\n")
            comma = "," if ky < kh - 1 else ""
            f.write(f"  }}{comma}\n")

        f.write("};\n\n")

        # Biais
        vals = ", ".join(format_float(b[i]) for i in range(len(b)))
        f.write(f"static const float {b_name}[{prefix}{outc_def}] = {{\n  {vals}\n}};\n\n")

        f.write(f"#endif // {guard}\n")

    print(f"  ✅ {path}  W={w.shape}  B={b.shape}")


def main() -> None:
    parser = argparse.ArgumentParser(description="Export poids Keras → headers C pour HLS")
    parser.add_argument("--model", default="/output/models/parking_cnn.h5")
    parser.add_argument("--out-dir", default="/app/hls")
    args = parser.parse_args()

    model = load_model(args.model)

    print("=" * 60)
    print("  EXPORT POIDS → .h (headers C pour HLS)")
    print("=" * 60)

    # Extraire les couches conv
    conv_layers = [l for l in model.layers if "conv2d" in l.name and l.get_weights()]

    if len(conv_layers) < 2:
        raise RuntimeError(f"Attendu >= 2 couches conv, trouvé {len(conv_layers)}")

    # Conv1 → weights.h
    w1, b1 = conv_layers[0].get_weights()
    w1 = np.asarray(w1, dtype=np.float32)
    b1 = np.asarray(b1, dtype=np.float32)
    write_weights_h(
        w1, b1,
        os.path.join(args.out_dir, "conv1_pool1", "src", "weights.h"),
        "WEIGHTS_H", "WEIGHTS", "BIASES",
        prefix="", kh_def="KH", kw_def="KW", inc_def="IN_C", outc_def="OUT_C",
    )

    # Conv2 → weights2.h
    w2, b2 = conv_layers[1].get_weights()
    w2 = np.asarray(w2, dtype=np.float32)
    b2 = np.asarray(b2, dtype=np.float32)
    write_weights_h(
        w2, b2,
        os.path.join(args.out_dir, "conv2_pool2", "src", "weights2.h"),
        "WEIGHTS2_H", "WEIGHTS2", "BIASES2",
        prefix="C2_", kh_def="KH", kw_def="KW", inc_def="IN_C", outc_def="OUT_C",
    )

    print("=" * 60)


if __name__ == "__main__":
    main()
