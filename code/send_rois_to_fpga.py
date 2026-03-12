#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
send_rois_to_fpga.py — Classification CNN split FPGA/CPU

Pipeline CNN :
  [FPGA] conv1_pool1 : 48×48×1  → 16×23×23
  [FPGA] conv2_pool2 : 16×23×23 → 32×10×10
  [ARM]  conv3 numpy vectorisé  → 64×8×8
  [ARM]  dense1 + dense2        → 2 classes (libre/occupé)
"""

import os
import time
import json
import glob
import traceback

import cv2
import numpy as np

# ============================================================
# CONFIG
# ============================================================
BASE_DIR    = "/home/xilinx/parking_system"
CROPS_DIR   = os.path.join(BASE_DIR, "data", "crops")
OUT_JSON    = os.path.join(BASE_DIR, "data", "fpga_results.json")
STATUS_PATH = os.path.join(BASE_DIR, "data", "fpga_status.json")
LOG_PATH    = os.path.join(BASE_DIR, "logs", "fpga_send.log")

BITSTREAM   = "/home/xilinx/docker/design_1_wrapper.bit"
HLS_DIR     = "/home/xilinx/docker"
WEIGHTS_DIR = "/home/xilinx/docker/weights"

CNN_SIZE       = 48
SEUIL          = 0.90
POLL_SEC       = 2.0
MAX_ROI        = 64
FPGA_RETRY_SEC = 30.0
HLS_TIMEOUT_ITER = 10000    # max itérations d'attente HLS (1ms chacune)
MAX_LOG_BYTES  = 2 * 1024 * 1024

# Fichiers de poids requis
REQUIRED_WEIGHTS = [
    ("weights3_from_hls.bin", HLS_DIR),
    ("biases3_from_hls.bin", HLS_DIR),
    ("03_dense_w0.bin", WEIGHTS_DIR),
    ("03_dense_w1.bin", WEIGHTS_DIR),
    ("04_dense_1_w0.bin", WEIGHTS_DIR),
    ("04_dense_1_w1.bin", WEIGHTS_DIR),
]

# ============================================================
# LOGGING avec rotation
# ============================================================
def log(msg: str):
    ts = time.strftime("%Y-%m-%d %H:%M:%S")
    line = f"[{ts}] {msg}"
    print(line)
    try:
        os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)
        if os.path.isfile(LOG_PATH):
            try:
                if os.path.getsize(LOG_PATH) > MAX_LOG_BYTES:
                    with open(LOG_PATH, "r") as f:
                        lines = f.readlines()
                    with open(LOG_PATH, "w") as f:
                        f.writelines(lines[len(lines)//2:])
            except Exception:
                pass
        with open(LOG_PATH, "a") as f:
            f.write(line + "\n")
    except Exception:
        pass

# ============================================================
# STATUS (pour l'IHM)
# ============================================================
def write_status(state, message=""):
    try:
        status = {
            "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
            "state": state,
            "message": message
        }
        tmp = STATUS_PATH + ".tmp"
        with open(tmp, "w") as f:
            json.dump(status, f, indent=2)
        os.replace(tmp, STATUS_PATH)
    except Exception:
        pass

# ============================================================
# UTILS
# ============================================================
def atomic_write_json(path, obj):
    try:
        os.makedirs(os.path.dirname(path), exist_ok=True)
        tmp = path + ".tmp"
        with open(tmp, "w") as f:
            json.dump(obj, f, indent=2)
        os.replace(tmp, path)
    except Exception as e:
        log(f"[ERROR] Écriture JSON {path}: {e}")

def list_roi_files(d):
    files = []
    for e in ("*.png", "*.jpg", "*.jpeg"):
        files.extend(glob.glob(os.path.join(d, e)))
    files.sort()
    return files

def load_roi_gray48(path):
    img = cv2.imread(path, cv2.IMREAD_GRAYSCALE)
    if img is None:
        raise ValueError(f"Impossible de lire: {path}")
    if img.shape[0] == 0 or img.shape[1] == 0:
        raise ValueError(f"Image vide: {path}")
    img = cv2.resize(img, (CNN_SIZE, CNN_SIZE), interpolation=cv2.INTER_AREA)
    return img.astype(np.float32) / 255.0

def check_weights():
    """Vérifie que tous les fichiers de poids existent et ne sont pas vides."""
    missing = []
    for fname, fdir in REQUIRED_WEIGHTS:
        fpath = os.path.join(fdir, fname)
        if not os.path.isfile(fpath):
            missing.append(fpath)
        elif os.path.getsize(fpath) == 0:
            missing.append(f"{fpath} (vide)")
    return missing

# ============================================================
# FPGA Engine
# ============================================================
class FPGAEngine:
    def __init__(self):
        self.enabled = False
        self.hls1 = None
        self.hls2 = None
        self.in1 = self.out1 = self.in2 = self.out2 = None
        self.W3_flat = self.B3 = self.W4 = self.B4 = self.W5 = self.B5 = None
        self._try_init()

    def _try_init(self):
        self.enabled = False

        if not os.path.exists(BITSTREAM):
            log(f"[WARN] Bitstream introuvable: {BITSTREAM}")
            write_status("error", f"Bitstream introuvable: {BITSTREAM}")
            return

        # Vérifier les poids
        missing = check_weights()
        if missing:
            log(f"[ERROR] Fichiers de poids manquants: {missing}")
            write_status("error", f"Poids manquants: {missing}")
            return

        try:
            log("Chargement des poids ARM...")
            self.W3_flat = np.fromfile(f"{HLS_DIR}/weights3_from_hls.bin", dtype=np.float32).reshape(3, 3, 32, 64).reshape(9 * 32, 64)
            self.B3      = np.fromfile(f"{HLS_DIR}/biases3_from_hls.bin",  dtype=np.float32)
            self.W4      = np.fromfile(f"{WEIGHTS_DIR}/03_dense_w0.bin",   dtype=np.float32).reshape(4096, 128)
            self.B4      = np.fromfile(f"{WEIGHTS_DIR}/03_dense_w1.bin",   dtype=np.float32)
            self.W5      = np.fromfile(f"{WEIGHTS_DIR}/04_dense_1_w0.bin", dtype=np.float32).reshape(128, 2)
            self.B5      = np.fromfile(f"{WEIGHTS_DIR}/04_dense_1_w1.bin", dtype=np.float32)

            # Validation des shapes
            assert self.B3.shape[0] == 64, f"B3 shape incorrect: {self.B3.shape}"
            assert self.B4.shape[0] == 128, f"B4 shape incorrect: {self.B4.shape}"
            assert self.B5.shape[0] == 2, f"B5 shape incorrect: {self.B5.shape}"
            log(f"[OK] Poids ARM chargés et validés")

            from pynq import Overlay, allocate

            log(f"[INFO] Chargement overlay: {BITSTREAM}")
            ol = Overlay(BITSTREAM)
            self.hls1 = ol.conv1_pool1_0
            self.hls2 = ol.conv2_pool2_0

            self.in1  = allocate(shape=(48*48,),     dtype=np.float32)
            self.out1 = allocate(shape=(16*23*23,),  dtype=np.float32)
            self.in2  = allocate(shape=(16*23*23,),  dtype=np.float32)
            self.out2 = allocate(shape=(32*10*10,),  dtype=np.float32)

            log(f"[OK] IPs HLS : conv1_pool1_0, conv2_pool2_0")
            log(f"[OK] Buffers : in1@0x{self.in1.physical_address:08X} out1@0x{self.out1.physical_address:08X}")
            log(f"              in2@0x{self.in2.physical_address:08X} out2@0x{self.out2.physical_address:08X}")

            self.enabled = True
            log("[OK] FPGAEngine prêt (AXI Lite, 2 IPs)")
            write_status("ok", "FPGA initialisé")

        except AssertionError as e:
            log(f"[ERROR] Validation poids échouée: {e}")
            write_status("error", f"Poids invalides: {e}")
            self.enabled = False
        except Exception as e:
            log("[ERROR] Initialisation FPGA impossible -> MODE TEST.")
            log("        " + str(e))
            write_status("error", f"Init FPGA: {e}")
            self.enabled = False

    def _run_hls(self, hls, in_buf, out_buf, data):
        in_buf[:] = data
        in_buf.sync_to_device()

        hls.write(0x10, in_buf.physical_address)
        hls.write(0x14, 0)
        hls.write(0x1C, out_buf.physical_address)
        hls.write(0x20, 0)

        hls.write(0x00, 0x10)
        hls.write(0x00, 0x01)

        # Attente avec timeout
        for i in range(HLS_TIMEOUT_ITER):
            if hls.read(0x00) & 0x06:
                break
            time.sleep(0.0001)
        else:
            raise RuntimeError(f"HLS timeout après {HLS_TIMEOUT_ITER} itérations")

        out_buf.sync_from_device()
        return np.array(out_buf)

    def predict_one(self, roi_norm):
        if not self.enabled:
            return {"ok": True, "mode": "mock", "pred": -1, "label": "?", "prob": 0.0}

        try:
            t0 = time.time()

            pool1 = self._run_hls(self.hls1, self.in1, self.out1, roi_norm.flatten())
            pool2 = self._run_hls(self.hls2, self.in2, self.out2, pool1)

            inp3 = pool2.reshape(32, 10, 10)
            patches = np.empty((64, 288), dtype=np.float32)
            idx = 0
            for ky in range(3):
                for kx in range(3):
                    patches[:, idx*32:(idx+1)*32] = inp3[:, ky:ky+8, kx:kx+8].reshape(32, 64).T
                    idx += 1
            out3 = np.maximum(patches @ self.W3_flat + self.B3, 0.0)

            flat   = out3.flatten()
            d1     = np.maximum(flat @ self.W4 + self.B4, 0.0)
            logits = d1 @ self.W5 + self.B5
            e      = np.exp(logits - logits.max())
            probs  = e / e.sum()

            classe = int(np.argmax(probs))
            prob   = float(probs[1])
            if prob < SEUIL:
                classe = 0

            label = "OCCUPIED" if classe == 1 else "FREE"
            elapsed = (time.time() - t0) * 1000

            return {"ok": True, "mode": "fpga", "pred": classe, "label": label,
                    "prob": round(prob, 4), "time_ms": round(elapsed, 1)}

        except RuntimeError as e:
            # HLS timeout — problème matériel potentiel
            log(f"[ERROR] HLS: {e}")
            return {"ok": False, "mode": "fpga", "error": str(e), "label": "?", "prob": 0.0}

        except Exception as e:
            return {"ok": False, "mode": "fpga", "error": str(e), "label": "?", "prob": 0.0,
                    "trace": traceback.format_exc()}

# ============================================================
# MAIN LOOP
# ============================================================
def main():
    os.makedirs(CROPS_DIR, exist_ok=True)
    os.makedirs(os.path.dirname(OUT_JSON), exist_ok=True)
    os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)

    log("=======================================================")
    log("  SMART PARKING — Classification CNN")
    log("  FPGA: conv1+pool1, conv2+pool2 (AXI Lite)")
    log("  CPU:  conv3, dense1, dense2, softmax (numpy)")
    log("=======================================================")
    log(f"  BITSTREAM   = {BITSTREAM}")
    log(f"  WEIGHTS_DIR = {WEIGHTS_DIR}")
    log(f"  CROPS_DIR   = {CROPS_DIR}")
    log(f"  CNN_SIZE    = {CNN_SIZE}×{CNN_SIZE}")
    log(f"  SEUIL       = {SEUIL}")
    log("=======================================================")

    fpga = FPGAEngine()
    last_retry = time.time()
    seen = {}
    hls_error_count = 0

    while True:
        try:
            # Re-init FPGA si pas prêt
            if not fpga.enabled and os.path.exists(BITSTREAM):
                if (time.time() - last_retry) >= FPGA_RETRY_SEC:
                    log("[INFO] Tentative re-init FPGA")
                    fpga = FPGAEngine()
                    last_retry = time.time()

            files = list_roi_files(CROPS_DIR)
            files_set = set(files)
            for k in list(seen.keys()):
                if k not in files_set:
                    del seen[k]

            todo = []
            for p in files:
                try:
                    mt = os.path.getmtime(p)
                except Exception:
                    continue
                if (p not in seen) or (seen[p] != mt):
                    todo.append((p, mt))

            if not todo:
                time.sleep(POLL_SEC)
                continue

            todo = todo[:MAX_ROI]

            results = {
                "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
                "mode": "fpga" if fpga.enabled else "mock",
                "cnn_size": [CNN_SIZE, CNN_SIZE],
                "items": []
            }

            for p, mt in todo:
                item = {"roi_path": p, "roi_file": os.path.basename(p)}
                try:
                    roi = load_roi_gray48(p)
                    pred = fpga.predict_one(roi)
                    item.update(pred)

                    if pred.get("ok"):
                        log(f"[OK] {item['roi_file']} → {item['mode']} : "
                            f"{item.get('label','?')} (prob={item.get('prob',0)}, "
                            f"{item.get('time_ms',0)}ms)")
                        hls_error_count = 0
                    else:
                        log(f"[WARN] {item['roi_file']} : {pred.get('error')}")
                        hls_error_count += 1
                        # Si trop d'erreurs HLS, re-init FPGA
                        if hls_error_count >= 5:
                            log("[ERROR] 5 erreurs HLS consécutives, re-init FPGA")
                            fpga = FPGAEngine()
                            hls_error_count = 0

                    seen[p] = mt

                except Exception as e:
                    item.update({"ok": False, "mode": "preprocess", "error": str(e), "label": "?"})
                    seen[p] = mt
                    log(f"[WARN] preprocess {os.path.basename(p)} : {e}")

                results["items"].append(item)

            atomic_write_json(OUT_JSON, results)
            write_status("ok", f"{len(results['items'])} ROIs traitées")

        except KeyboardInterrupt:
            log("[EXIT] Arrêt propre")
            write_status("stopped", "Arrêt manuel")
            break

        except Exception as loop_err:
            log("[FATAL] Boucle principale: " + str(loop_err))
            log(traceback.format_exc())
            write_status("error", str(loop_err))
            time.sleep(5.0)

if __name__ == "__main__":
    main()
