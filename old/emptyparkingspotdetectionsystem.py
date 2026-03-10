"""
Parking slot occupancy inference (ROI polygon + CNN classifier).

✅ No hard-coded paths:
  python emptyparkingspotdetectionsystem.py --image assets/parkingarea.png --coords outputs/coords.json --model models/parking_cnn.h5 --out outputs/result.png

What it does:
- Loads polygons (quadrilaterals) from JSON
- Warps each polygon to 48x48 grayscale
- Runs the CNN to classify EMPTY vs OCCUPIED
- Draws an overlay and optionally writes an output image

It does NOT auto-detect slot polygons. Use label_coords.py / parkingspotcoordinate.py to create coords JSON.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Iterable, Tuple

import cv2
import numpy as np
from tensorflow.keras.models import load_model


IN_SIZE = 48  # model input size (48x48)


def project_root() -> Path:
    return Path(__file__).resolve().parent


def resolve_path(p: str | Path) -> Path:
    p = Path(p)
    return p if p.is_absolute() else (project_root() / p).resolve()


def order_points(pts: np.ndarray) -> np.ndarray:
    """Reorder 4 points to: top-left, top-right, bottom-right, bottom-left."""
    rect = np.zeros((4, 2), dtype="float32")
    s = pts.sum(axis=1)
    diff = np.diff(pts, axis=1)

    rect[0] = pts[np.argmin(s)]      # top-left
    rect[2] = pts[np.argmax(s)]      # bottom-right
    rect[1] = pts[np.argmin(diff)]   # top-right
    rect[3] = pts[np.argmax(diff)]   # bottom-left
    return rect


def warp_quad(gray: np.ndarray, quad: Iterable[Iterable[int]], out_size: int = IN_SIZE) -> np.ndarray:
    pts = np.array(list(quad), dtype="float32")
    if pts.shape != (4, 2):
        raise ValueError(f"Each polygon must have 4 points, got shape {pts.shape}")
    rect = order_points(pts)
    dst = np.array(
        [[0, 0], [out_size - 1, 0], [out_size - 1, out_size - 1], [0, out_size - 1]],
        dtype="float32",
    )
    M = cv2.getPerspectiveTransform(rect, dst)
    warp = cv2.warpPerspective(gray, M, (out_size, out_size))
    return warp


def draw_poly(img: np.ndarray, poly: Iterable[Iterable[int]], color: Tuple[int, int, int], thickness: int = 2) -> None:
    p = np.array(list(poly), dtype=np.int32).reshape((-1, 1, 2))
    cv2.polylines(img, [p], True, color, thickness)


def poly_center(poly: Iterable[Iterable[int]]) -> Tuple[int, int]:
    pts = np.array(list(poly), dtype=np.float32)
    c = pts.mean(axis=0)
    return int(c[0]), int(c[1])


def main() -> None:
    parser = argparse.ArgumentParser(description="Run parking slot inference (no hard-coded paths).")
    parser.add_argument("--model", default="models/parking_cnn.h5", help="Path to trained .h5 model.")
    parser.add_argument("--coords", default="outputs/coords.json", help="Path to polygons JSON.")
    parser.add_argument("--image", default="assets/parkingarea.png", help="Path to input image.")
    parser.add_argument("--out", default="outputs/result.png", help="Where to save overlay image.")
    parser.add_argument("--threshold", type=float, default=0.5, help="Decision threshold for EMPTY.")
    parser.add_argument("--empty-index", type=int, default=0, help="Class index for EMPTY in model output.")
    parser.add_argument("--no-gui", action="store_true", help="Disable OpenCV GUI window.")
    args = parser.parse_args()

    model_path = resolve_path(args.model)
    coords_path = resolve_path(args.coords)
    image_path = resolve_path(args.image)
    out_path = resolve_path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)

    if not model_path.exists():
        raise FileNotFoundError(f"Model not found: {model_path}")
    if not coords_path.exists():
        raise FileNotFoundError(f"Coords JSON not found: {coords_path}")
    if not image_path.exists():
        raise FileNotFoundError(f"Image not found: {image_path}")

    model = load_model(str(model_path))

    with open(coords_path, "r", encoding="utf-8") as f:
        polys = json.load(f)

    img = cv2.imread(str(image_path))
    if img is None:
        raise FileNotFoundError(f"Cannot read image: {image_path}")

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    overlay = img.copy()

    empty_count = 0
    occ_count = 0

    for i, poly in enumerate(polys, start=1):
        warp = warp_quad(gray, poly, out_size=IN_SIZE)
        x = (warp.astype(np.float32) / 255.0).reshape((1, IN_SIZE, IN_SIZE, 1))
        probs = model.predict(x, verbose=0)[0]
        p_empty = float(probs[int(args.empty_index)])

        is_empty = p_empty >= args.threshold
        if is_empty:
            empty_count += 1
            color = (0, 255, 0)
            label = f"EMPTY {p_empty:.2f}"
        else:
            occ_count += 1
            color = (0, 0, 255)
            label = f"OCC {p_empty:.2f}"

        draw_poly(overlay, poly, color=color, thickness=2)
        cx, cy = poly_center(poly)
        cv2.putText(overlay, label, (cx - 40, cy), cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 2, cv2.LINE_AA)

    header = f"slots={len(polys)} empty={empty_count} occupied={occ_count} thr={args.threshold}"
    cv2.putText(overlay, header, (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 255), 2, cv2.LINE_AA)

    cv2.imwrite(str(out_path), overlay)
    print("============================================================")
    print("PARKING SLOT INFERENCE")
    print("============================================================")
    print(f"Image:   {image_path}")
    print(f"Coords:  {coords_path}  (slots={len(polys)})")
    print(f"Model:   {model_path}")
    print(f"Out:     {out_path}")
    print(f"Empty:   {empty_count} | Occupied: {occ_count} | thr={args.threshold}")
    print("------------------------------------------------------------")
    print("✅ Done.")

    if not args.no_gui:
        cv2.imshow("result", overlay)
        cv2.waitKey(0)
        cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
