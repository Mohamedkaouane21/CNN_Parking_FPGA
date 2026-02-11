import cv2
import numpy as np
import json
from keras.models import load_model

# =========================
# CONFIG
# =========================
MODEL_PATH = "emptyparkingspotdetectionmodel.h5"
COORDS_JSON = "coords.json"
IMAGE_PATH = "/home/tpreseau/Téléchargements/mage_decoupe.jpg"

# Ton entraînement met label=0 pour empty et label=1 pour occupied,
# MAIS parfois on se trompe/inverse. Change à 1 si nécessaire.
EMPTY_INDEX = 0

# Seuil de décision : plus haut = plus strict pour déclarer "vide"
THRESHOLD = 0.01

# Taille d'entrée du modèle (dans ton training: 48x48)
IN_SIZE = 48


# =========================
# UTILS
# =========================
def order_points(pts):
    """
    Réordonne 4 points en: top-left, top-right, bottom-right, bottom-left.
    pts: [[x,y], [x,y], [x,y], [x,y]]
    """
    pts = np.array(pts, dtype="float32")

    s = pts.sum(axis=1)
    diff = np.diff(pts, axis=1).reshape(-1)

    tl = pts[np.argmin(s)]
    br = pts[np.argmax(s)]
    tr = pts[np.argmin(diff)]
    bl = pts[np.argmax(diff)]

    return np.array([tl, tr, br, bl], dtype="float32")


def warp_slot_to_fixed(gray_img, poly4, size=48):
    """
    Warp perspective d'un polygone 4 points vers une image size x size.
    gray_img: image grayscale
    poly4: 4 points
    """
    src = order_points(poly4)
    dst = np.array(
        [[0, 0], [size - 1, 0], [size - 1, size - 1], [0, size - 1]],
        dtype="float32",
    )
    M = cv2.getPerspectiveTransform(src, dst)
    warped = cv2.warpPerspective(gray_img, M, (size, size))
    return warped


def poly_center(poly4):
    p = np.array(poly4, dtype=np.int32)
    cx = int(np.mean(p[:, 0]))
    cy = int(np.mean(p[:, 1]))
    return cx, cy


def clamp_poly_to_image(poly4, w, h):
    """
    Sécurise les points pour qu'ils restent dans l'image.
    """
    out = []
    for x, y in poly4:
        x = int(max(0, min(x, w - 1)))
        y = int(max(0, min(y, h - 1)))
        out.append([x, y])
    return out


# =========================
# PREDICTION
# =========================
def predict_slot(model, image_bgr, poly4):
    """
    Retourne (is_empty, p_empty, p_occ, probs)
    """
    h, w = image_bgr.shape[:2]
    poly4 = clamp_poly_to_image(poly4, w, h)

    gray = cv2.cvtColor(image_bgr, cv2.COLOR_BGR2GRAY)
    slot_img = warp_slot_to_fixed(gray, poly4, size=IN_SIZE)

    x = slot_img.astype("float32") / 255.0
    x = x[None, ..., None]  # (1,48,48,1)

    probs = model.predict(x, verbose=0)[0]  # shape (2,)
    p_empty = float(probs[EMPTY_INDEX])
    p_occ = float(probs[1 - EMPTY_INDEX])

    is_empty = p_empty >= THRESHOLD
    return is_empty, p_empty, p_occ, probs


# =========================
# MAIN
# =========================
def main():
    # Load model
    model = load_model(MODEL_PATH)

    # Load polys from JSON
    with open(COORDS_JSON, "r", encoding="utf-8") as f:
        polys = json.load(f)

    # Load image
    img = cv2.imread(IMAGE_PATH)
    if img is None:
        raise FileNotFoundError(IMAGE_PATH)

    empty_count = 0

    for poly in polys:
        is_empty, p_empty, p_occ, _ = predict_slot(model, img, poly)

        color = (0, 255, 0) if is_empty else (0, 0, 255)
        if is_empty:
            empty_count += 1

        # draw polygon
        poly_np = np.array(poly, dtype=np.int32).reshape((-1, 1, 2))
        cv2.polylines(img, [poly_np], True, color, 2)

        # write probs near center
        cx, cy = poly_center(poly)
        txt = f"E:{p_empty:.2f} O:{p_occ:.2f}"
        cv2.putText(
            img,
            txt,
            (cx - 50, cy),
            cv2.FONT_HERSHEY_SIMPLEX,
            0.55,
            (255, 255, 255),
            2,
            cv2.LINE_AA,
        )

    # header
    cv2.putText(
        img,
        f"Empty Spots: {empty_count}",
        (50, 50),
        cv2.FONT_HERSHEY_SIMPLEX,
        1.5,
        (255, 255, 255),
        3,
        cv2.LINE_AA,
    )

    cv2.imshow("Parking Lot", img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
