#!/usr/bin/env python3
"""
regen_golden.py - conv2_pool2
Genere input_pool1.bin et golden_pool2.bin depuis les poids du modele.
"""
import numpy as np, os, sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DATA_DIR   = os.path.join(SCRIPT_DIR, "data")
FPGA_DIR   = os.path.join(SCRIPT_DIR, "..", "conv1_pool1_v4", "weights_update", "data")

# Chemins
IN48_PATH  = os.path.join(DATA_DIR, "input_pool1.bin")   # sera genere
GOLD_PATH  = os.path.join(DATA_DIR, "golden_pool2.bin")
W1_PATH    = os.path.join(DATA_DIR, "..", "src", "weights2.h")  # pas utilise ici

# Charger les poids
def load(name):
    # Chercher dans data/ ou dans le dossier fpga_weights du projet
    for d in [DATA_DIR, os.path.join(SCRIPT_DIR, "fpga_weights")]:
        p = os.path.join(d, name)
        if os.path.exists(p): return np.fromfile(p, dtype=np.float32)
    raise FileNotFoundError(name)

try:
    W1 = load("00_conv2d_w0.bin").reshape(3,3,1,16)
    B1 = load("00_conv2d_w1.bin")
    W2 = load("01_conv2d_1_w0.bin").reshape(3,3,16,32)
    B2 = load("01_conv2d_1_w1.bin")
    inp = np.fromfile(os.path.join(DATA_DIR, "..", "data", "input_48x48.bin"), dtype=np.float32).reshape(48,48)
except FileNotFoundError as e:
    print(f"ERROR: {e}")
    print("Assurez-vous que les fichiers bin sont dans data/ ou fpga_weights/")
    sys.exit(1)

# Conv1 + Pool1
c1 = np.zeros((16,46,46), dtype=np.float32)
for oc in range(16):
    for oy in range(46):
        for ox in range(46):
            c1[oc,oy,ox] = max(0, B1[oc]+(inp[oy:oy+3,ox:ox+3]*W1[:,:,0,oc]).sum())
p1 = c1[:,:46,:46].reshape(16,23,2,23,2).max(axis=(2,4))

# Sauvegarder input_pool1.bin
os.makedirs(DATA_DIR, exist_ok=True)
p1.tofile(os.path.join(DATA_DIR, "input_pool1.bin"))
print(f"input_pool1.bin : {p1.shape}  min={p1.min():.4f}  max={p1.max():.4f}")

# Conv2 + Pool2
c2 = np.zeros((32,21,21), dtype=np.float32)
for oc in range(32):
    for oy in range(21):
        for ox in range(21):
            acc = B2[oc]
            for ic in range(16):
                acc += (p1[ic,oy:oy+3,ox:ox+3]*W2[:,:,ic,oc]).sum()
            c2[oc,oy,ox] = max(0,acc)

p2 = c2[:,:20,:20].reshape(32,10,2,10,2).max(axis=(2,4))
p2.tofile(GOLD_PATH)
print(f"golden_pool2.bin: {p2.shape}  min={p2.min():.4f}  max={p2.max():.4f}")
print("Done.")
