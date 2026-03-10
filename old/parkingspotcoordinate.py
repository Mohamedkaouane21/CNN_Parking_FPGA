import cv2
import json
import numpy as np

IMG_PATH = "/home/tpreseau/Téléchargements/mage_decoupe.jpg"
OUT_JSON = "coords.json"

img = cv2.imread(IMG_PATH)
if img is None:
    raise FileNotFoundError(IMG_PATH)

polys = []   # [[x,y],[x,y],[x,y],[x,y]]
pts = []     # points en cours (0..4)
show = img.copy()

def save():
    with open(OUT_JSON, "w", encoding="utf-8") as f:
        json.dump(polys, f, indent=2)
    print(f"✅ Saved {len(polys)} polygons -> {OUT_JSON}")

def redraw():
    global show
    show = img.copy()

    # polygones déjà validés
    for poly in polys:
        p = np.array(poly, dtype=np.int32).reshape((-1, 1, 2))
        cv2.polylines(show, [p], True, (0, 255, 0), 2)

    # points en cours
    for (x, y) in pts:
        cv2.circle(show, (x, y), 4, (0, 0, 255), -1)

    # segment temporaire
    if len(pts) >= 2:
        p = np.array(pts, dtype=np.int32).reshape((-1, 1, 2))
        cv2.polylines(show, [p], False, (0, 0, 255), 2)

    cv2.putText(
        show,
        "4 clicks=1 slot | s=save | u=undo point | r=remove last | q=quit+save",
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
            print(f"Slot #{len(polys)}: {pts}")
            pts = []
        redraw()

cv2.namedWindow("image", cv2.WINDOW_NORMAL)
cv2.setMouseCallback("image", on_mouse)
redraw()

while True:
    cv2.imshow("image", show)
    k = cv2.waitKey(20) & 0xFF

    if k == ord("u") and pts:
        pts.pop()
        redraw()

    if k == ord("r") and polys:
        polys.pop()
        redraw()

    if k == ord("s"):
        save()

    if k == ord("q"):
        save()  # autosave avant quitter
        break

cv2.destroyAllWindows()
