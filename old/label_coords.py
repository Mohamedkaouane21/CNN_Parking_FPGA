import cv2
import json
import numpy as np

IMG_PATH = "/home/tpreseau/Téléchargements/mage_decoupe.jpg"
OUT_JSON = "coords.json"

img = cv2.imread(IMG_PATH)
if img is None:
    raise FileNotFoundError(IMG_PATH)

polys = []   # list of polygons: [[x,y],[x,y],[x,y],[x,y]]
pts = []     # current polygon points (up to 4)
show = img.copy()

def redraw():
    global show
    show = img.copy()

    # draw saved polys
    for poly in polys:
        p = np.array(poly, dtype=np.int32).reshape((-1, 1, 2))
        cv2.polylines(show, [p], isClosed=True, color=(0, 255, 0), thickness=2)

    # draw current points + partial poly
    for (x, y) in pts:
        cv2.circle(show, (x, y), 4, (0, 0, 255), -1)

    if len(pts) >= 2:
        p = np.array(pts, dtype=np.int32).reshape((-1, 1, 2))
        cv2.polylines(show, [p], isClosed=False, color=(0, 0, 255), thickness=2)

    cv2.putText(
        show,
        "4 clicks = 1 slot | s=save r=removeLast u=undoPoint q=quit",
        (10, 30),
        cv2.FONT_HERSHEY_SIMPLEX,
        0.7,
        (255, 255, 255),
        2,
        cv2.LINE_AA
    )

def on_mouse(event, x, y, flags, param):
    global pts, polys
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

    if k == ord('q'):
        break

    if k == ord('u'):  # undo current point
        if pts:
            pts.pop()
            redraw()

    if k == ord('r'):  # remove last polygon
        if polys:
            polys.pop()
            redraw()

    if k == ord('s'):
        with open(OUT_JSON, "w", encoding="utf-8") as f:
            json.dump(polys, f, indent=2)
        print(f"Saved {len(polys)} polygons -> {OUT_JSON}")

cv2.destroyAllWindows()
