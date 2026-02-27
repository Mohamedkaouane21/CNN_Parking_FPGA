


import numpy as np
import cv2
import tensorflow as tf
from tensorflow.keras.models import load_model, Model

MODEL = "models/parking_cnn.h5"
IMG   = "data/occupied/roi_0afe47848d83442aab573dcf41543c25_occupied.jpg"

m = load_model(MODEL)

# Force build du modèle (donne une entrée définie)
dummy = np.zeros((1, 48, 48, 1), dtype=np.float32)
_ = m(dummy, training=False)

# Trouver la première couche MaxPool
pool1_layer = None
for layer in m.layers:
    name = layer.name.lower()
    if "max" in name and "pool" in name:
        pool1_layer = layer
        break
if pool1_layer is None:
    raise RuntimeError("pool1 layer not found (no MaxPool layer detected)")

sub = Model(inputs=m.inputs, outputs=pool1_layer.output)

img = cv2.imread(IMG, cv2.IMREAD_GRAYSCALE)
if img is None:
    raise FileNotFoundError(IMG)

img = cv2.resize(img, (48, 48)).astype(np.float32)
x = (img / 255.0).reshape(1, 48, 48, 1)

y = sub.predict(x, verbose=0)[0].astype(np.float32)  # (24,24,16)
print("pool1 out shape:", y.shape)

y.tofile("golden_pool1.bin")
print("Wrote golden_pool1.bin")






