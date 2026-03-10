"""
Manual polygon labeling tool for parking slots.

✅ No hard-coded paths:
- Provide the image via --image
- Choose output JSON via --out (default: outputs/coords.json)

Usage:
  python label_coords.py --image assets/parkingarea.png --out outputs/coords.json
Keys:
  - 4 clicks = 1 slot polygon (quadrilateral)
  - s: save
  - u: undo last point of current polygon
  - r: remove last completed polygon
  - q: quit
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

import cv2
import numpy as np


def project_root() -> Path:
    return Path(__file__).resolve().parent


def resolve_path(p: str | Path) -> Path:
    p = Path(p)
    return p if p.is_absolute() else (project_root() / p).resolve()


def main() -> None:
    parser = argparse.ArgumentParser(description="Label parking slots as polygons (no hard-coded paths).")
    parser.add_argument("--image", default="assets/parkingarea.png", help="Path to the reference image.")
    parser.add_argument("--out", default="outputs/coords.json", help="Output JSON path for polygons.")
    args = parser.parse_args()

    img_path = resolve_path(args.image)
    out_json = resolve_path(args.out)
    out_json.parent.mkdir(parents=True, exist_ok=True)

    img = cv2.imread(str(img_path))
    if img is None:
        raise FileNotFoundError(f"Cannot read image: {img_path}")

    polys: list[list[list[int]]] = []  # [[[x,y],...4], ...]
    pts: list[list[int]] = []
    show = img.copy()

    def redraw() -> None:
        nonlocal show
        show = img.copy()

        for poly in polys:
            p = np.array(poly, dtype=np.int32).reshape((-1, 1, 2))
            cv2.polylines(show, [p], isClosed=True, color=(0, 255, 0), thickness=2)

        for (x, y) in pts:
            cv2.circle(show, (x, y), 4, (0, 0, 255), -1)

        if len(pts) >= 2:
            p = np.array(pts, dtype=np.int32).reshape((-1, 1, 2))
            cv2.polylines(show, [p], isClosed=False, color=(0, 0, 255), thickness=2)

        cv2.putText(
            show,
            "4 clicks=1 slot | s=save u=undo r=removeLast q=quit",
            (10, 30),
            cv2.FONT_HERSHEY_SIMPLEX,
            0.7,
            (255, 255, 255),
            2,
            cv2.LINE_AA,
        )

    def save() -> None:
        with open(out_json, "w", encoding="utf-8") as f:
            json.dump(polys, f, indent=2)
        print(f"✅ Saved {len(polys)} polygons -> {out_json}")

    def on_mouse(event, x, y, flags, param) -> None:
        nonlocal pts, polys
        if event == cv2.EVENT_LBUTTONDOWN:
            pts.append([int(x), int(y)])
            if len(pts) == 4:
                polys.append(pts)
                pts = []
            redraw()

    cv2.namedWindow("label", cv2.WINDOW_NORMAL)
    cv2.setMouseCallback("label", on_mouse)
    redraw()

    while True:
        cv2.imshow("label", show)
        k = cv2.waitKey(20) & 0xFF

        if k == ord("q"):
            break
        if k == ord("u") and pts:
            pts.pop()
            redraw()
        if k == ord("r") and polys:
            polys.pop()
            redraw()
        if k == ord("s"):
            save()

    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
