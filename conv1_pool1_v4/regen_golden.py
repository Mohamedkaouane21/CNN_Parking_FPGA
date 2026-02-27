#!/usr/bin/env python3
"""
regen_golden.py
Genere golden_pool1.bin avec les vrais poids du modele parking_cnn.h5
Pipeline : Conv2D 3x3 valid + ReLU + MaxPool 2x2 stride 2
Convention poids : W[KH][KW][IN_C][OUT_C] (TF/Keras)
"""
import numpy as np
import os, sys

SCRIPT_DIR  = os.path.dirname(os.path.abspath(__file__))
DATA_DIR    = os.path.join(SCRIPT_DIR, "data")
IN_PATH     = os.path.join(DATA_DIR, "input_48x48.bin")
GOLDEN_PATH = os.path.join(DATA_DIR, "golden_pool1.bin")
W_PATH      = os.path.join(DATA_DIR, "00_conv2d_w0.bin")
B_PATH      = os.path.join(DATA_DIR, "00_conv2d_w1.bin")

for p in [IN_PATH, W_PATH, B_PATH]:
    if not os.path.exists(p):
        print(f"ERROR: manquant : {p}"); sys.exit(1)

inp = np.fromfile(IN_PATH, dtype=np.float32).reshape(48, 48)
W   = np.fromfile(W_PATH,  dtype=np.float32).reshape(3, 3, 1, 16)
B   = np.fromfile(B_PATH,  dtype=np.float32)

print(f"Input  : min={inp.min():.4f}  max={inp.max():.4f}")
print(f"Poids  : min={W.min():.4f}   max={W.max():.4f}")
print(f"Biais  : {B}")

# Conv2D valid
conv = np.zeros((16, 46, 46), dtype=np.float32)
for oc in range(16):
    for oy in range(46):
        for ox in range(46):
            acc = B[oc]
            for ky in range(3):
                for kx in range(3):
                    acc += inp[oy+ky, ox+kx] * W[ky, kx, 0, oc]
            conv[oc, oy, ox] = acc

# ReLU
relu = np.maximum(0, conv).astype(np.float32)

# MaxPool 2x2 stride 2
pool = np.zeros((16, 23, 23), dtype=np.float32)
for oc in range(16):
    for py in range(23):
        for px in range(23):
            pool[oc, py, px] = relu[oc, py*2:py*2+2, px*2:px*2+2].max()

pool.tofile(GOLDEN_PATH)
print(f"\nGolden : {GOLDEN_PATH}")
print(f"Pool   : min={pool.min():.4f}  max={pool.max():.4f}  mean={pool.mean():.4f}")
print(f"  {pool.size} floats  x  4 octets  =  {pool.nbytes} octets")
