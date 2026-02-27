import numpy as np
import cv2
from tensorflow.keras.models import load_model

MODEL = "models/parking_cnn.h5"
IMG   = "data/occupied/roi_0afe47848d83442aab573dcf41543c25_occupied.jpg"   # une ROI déjà extraite, ou une image 48x48


import matplotlib.pyplot as plt

plt.imshow(img, cmap="gray")
plt.title("Image après resize 48x48")
plt.colorbar()
plt.show()

print("Shape:", img.shape)
print("Min:", img.min(), "Max:", img.max())


model = load_model(MODEL)

img = cv2.imread(IMG, cv2.IMREAD_GRAYSCALE)
if img is None:
    raise FileNotFoundError(IMG)

img = cv2.resize(img, (48,48)).astype(np.float32)
x = img / 255.0
x = x.reshape(1,48,48,1)

y = model.predict(x, verbose=0)[0].astype(np.float32)

print("Golden output:", y, "pred=", int(np.argmax(y)))

x.astype(np.float32).tofile("input_48x48.bin")
y.tofile("golden_out.bin")
print("Wrote input_48x48.bin + golden_out.bin")