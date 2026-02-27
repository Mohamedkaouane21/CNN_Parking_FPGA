import os
import numpy as np
from tensorflow.keras.models import load_model

MODEL = "models/parking_cnn.h5"
OUTDIR = "fpga_weights"

os.makedirs(OUTDIR, exist_ok=True)
model = load_model(MODEL)

i = 0
for layer in model.layers:
    w = layer.get_weights()
    if not w:
        continue

    # w[0] = weights, w[1] = bias (souvent)
    for j, arr in enumerate(w):
        arr = np.asarray(arr, dtype=np.float32)
        fname = f"{i:02d}_{layer.name}_w{j}.bin"
        arr.tofile(os.path.join(OUTDIR, fname))
        print(fname, arr.shape)
    i += 1

print("Done ->", OUTDIR)