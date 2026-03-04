#!/usr/bin/env python3
"""
parking_live.py  v5
-------------------
Détection de places de parking en temps réel depuis caméra Reolink.
Tourne sur la PYNQ-Z2.

Pipeline CNN :
  [FPGA] conv1_pool1 : 48×48×1  → 16×23×23
  [FPGA] conv2_pool2 : 16×23×23 → 32×10×10
  [ARM]  conv3 numpy vectorisé  → 64×8×8
  [ARM]  dense1 + dense2        → 2 classes (libre/occupé)

Envoi série vers ESP32 à chaque cycle.
"""

import cv2
import numpy as np
import json
import time
import os
import shutil
import serial
from pynq import Overlay, allocate

# ============================================================
# CONFIG
# ============================================================
RTSP_URL    = "rtsp://viewer:Lecture123@192.168.0.7:8554/live"
COORDS_JSON = "/home/xilinx/jupyter_notebooks/coords_video.json"
BITSTREAM   = "/home/xilinx/jupyter_notebooks/design_1_wrapper.bit"
HLS_DIR     = "/home/xilinx/jupyter_notebooks"
WEIGHTS_DIR = "/home/xilinx/jupyter_notebooks/weights"
INTERVAL_S  = 10
SEUIL       = 0.90
OUT_IMAGE   = "/home/xilinx/jupyter_notebooks/result_live.png"
OUT_JSON    = "/home/xilinx/jupyter_notebooks/result_live.json"
RESULTS_DIR = "/home/xilinx/jupyter_notebooks/results"

# Série ESP32
SERIAL_PORT = "/dev/ttyUSB0"
SERIAL_BAUD = 115200
SERIAL_ZONE = "A"

# ============================================================
# FPGA
# ============================================================
def init_fpga():
    print("Chargement bitstream FPGA...")
    ol   = Overlay(BITSTREAM)
    hls1 = ol.conv1_pool1_0
    hls2 = ol.conv2_pool2_0
    in1  = allocate(shape=(48*48,),    dtype=np.float32)
    out1 = allocate(shape=(16*23*23,), dtype=np.float32)
    in2  = allocate(shape=(16*23*23,), dtype=np.float32)
    out2 = allocate(shape=(32*10*10,), dtype=np.float32)
    print("FPGA prêt.")
    return hls1, hls2, in1, out1, in2, out2

def run_hls(hls, in_buf, out_buf, data):
    in_buf[:] = data
    in_buf.sync_to_device()
    hls.write(0x10, in_buf.physical_address)
    hls.write(0x14, 0)
    hls.write(0x1C, out_buf.physical_address)
    hls.write(0x20, 0)
    hls.write(0x00, 0x10)
    hls.write(0x00, 0x01)
    for _ in range(5000):
        if hls.read(0x00) & 0x06:
            break
        time.sleep(0.0001)
    out_buf.sync_from_device()
    return np.array(out_buf)

# ============================================================
# POIDS ARM
# ============================================================
def load_weights():
    print("Chargement des poids ARM...")
    W3      = np.fromfile(f"{HLS_DIR}/weights3_from_hls.bin", dtype=np.float32).reshape(3, 3, 32, 64)
    B3      = np.fromfile(f"{HLS_DIR}/biases3_from_hls.bin",  dtype=np.float32)
    W3_flat = W3.reshape(9 * 32, 64)
    W4      = np.fromfile(f"{WEIGHTS_DIR}/03_dense_w0.bin",   dtype=np.float32).reshape(4096, 128)
    B4      = np.fromfile(f"{WEIGHTS_DIR}/03_dense_w1.bin",   dtype=np.float32)
    W5      = np.fromfile(f"{WEIGHTS_DIR}/04_dense_1_w0.bin", dtype=np.float32).reshape(128, 2)
    B5      = np.fromfile(f"{WEIGHTS_DIR}/04_dense_1_w1.bin", dtype=np.float32)
    print("Poids chargés.")
    return W3_flat, B3, W4, B4, W5, B5

# ============================================================
# INFÉRENCE
# ============================================================
def predict(roi_norm, hls1, hls2, in1, out1, in2, out2,
            W3_flat, B3, W4, B4, W5, B5):
    pool1   = run_hls(hls1, in1, out1, roi_norm.flatten())
    pool2   = run_hls(hls2, in2, out2, pool1)
    inp3    = pool2.reshape(32, 10, 10)
    patches = np.empty((64, 288), dtype=np.float32)
    idx = 0
    for ky in range(3):
        for kx in range(3):
            patches[:, idx*32:(idx+1)*32] = inp3[:, ky:ky+8, kx:kx+8].reshape(32, 64).T
            idx += 1
    out3   = np.maximum(patches @ W3_flat + B3, 0.0)
    flat   = out3.flatten()
    d1     = np.maximum(flat @ W4 + B4, 0.0)
    logits = d1 @ W5 + B5
    e      = np.exp(logits - logits.max())
    probs  = e / e.sum()
    return int(np.argmax(probs)), float(probs[1])

# ============================================================
# UTILITAIRES IMAGE
# ============================================================
def extract_roi(frame, polygon):
    pts = np.array(polygon, dtype=np.float32)
    dst = np.array([[0,0],[47,0],[47,47],[0,47]], dtype=np.float32)
    M   = cv2.getPerspectiveTransform(pts, dst)
    roi = cv2.warpPerspective(frame, M, (48, 48))
    return cv2.cvtColor(roi, cv2.COLOR_BGR2GRAY)

def draw_results(frame, slots, results):
    vis       = frame.copy()
    n_libre   = sum(1 for r in results if r['classe'] == 0)
    n_occupee = sum(1 for r in results if r['classe'] == 1)
    for i, (slot, res) in enumerate(zip(slots, results)):
        pts   = np.array(slot, dtype=np.int32)
        color = (0, 0, 255) if res['classe'] == 1 else (0, 255, 0)
        cv2.polylines(vis, [pts], isClosed=True, color=color, thickness=3)
        cx = int(np.mean([p[0] for p in slot]))
        cy = int(np.mean([p[1] for p in slot]))
        cv2.putText(vis, str(i),
                    (cx-15, cy-10), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255,255,0), 2)
        cv2.putText(vis, 'O' if res['classe'] == 1 else 'L',
                    (cx-10, cy+20), cv2.FONT_HERSHEY_SIMPLEX, 0.8, color, 2)
    ts = time.strftime("%d/%m/%Y %H:%M:%S")
    cv2.rectangle(vis, (0, 0), (vis.shape[1], 50), (0, 0, 0), -1)
    cv2.putText(vis,
                f"{ts}  |  LIBRES: {n_libre}  OCCUPEES: {n_occupee}  TOTAL: {len(results)}",
                (10, 33), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 255, 255), 2)
    return vis

# ============================================================
# SERIAL ESP32
# ============================================================
def init_serial():
    try:
        ser = serial.Serial(SERIAL_PORT, SERIAL_BAUD, timeout=1)
        time.sleep(2)
        print(f"Série ESP32 prêt sur {SERIAL_PORT} @ {SERIAL_BAUD} baud")
        return ser
    except Exception as e:
        print(f"[SERIE] Erreur ouverture {SERIAL_PORT} : {e}")
        return None

def send_serial(ser, n_libre, n_total):
    if ser is None or not ser.is_open:
        return
    msg = json.dumps({
        "zone":             SERIAL_ZONE,
        "nb_places_libres": n_libre,
        "nb_places_total":  n_total,
        "device":           "camera"
    }) + "\n"
    try:
        ser.write(msg.encode('utf-8'))
        print(f"[SERIE] Envoyé : {msg.strip()}")
    except Exception as e:
        print(f"[SERIE] Erreur envoi : {e}")

# ============================================================
# MAIN
# ============================================================
def main():
    print("=" * 55)
    print("  PARKING LIVE v5 - PYNQ-Z2 + FPGA + Reolink")
    print("=" * 55)
    print(f"  RTSP      : {RTSP_URL}")
    print(f"  Intervalle: {INTERVAL_S}s")
    print(f"  Seuil     : {SEUIL}")
    print(f"  Résultats : {RESULTS_DIR}")
    print(f"  Série     : {SERIAL_PORT} @ {SERIAL_BAUD}")
    print("=" * 55)

    os.makedirs(RESULTS_DIR, exist_ok=True)

    hls1, hls2, in1, out1, in2, out2 = init_fpga()
    W3_flat, B3, W4, B4, W5, B5      = load_weights()
    ser                               = init_serial()

    with open(COORDS_JSON) as f:
        slots = json.load(f)
    print(f"{len(slots)} places chargées.\n")
    print("Démarrage... (Ctrl+C pour quitter)\n")

    cap = cv2.VideoCapture(RTSP_URL, cv2.CAP_FFMPEG)
    cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)

    cycle = 0
    while True:
        cycle += 1
        ts    = time.strftime("%H:%M:%S")
        ts_fn = time.strftime("%Y%m%d_%H%M%S")

        for _ in range(3):
            cap.grab()
        ret, frame = cap.retrieve()

        if not ret or frame is None:
            print(f"[{ts}] Frame perdue, reconnexion...")
            cap.release()
            time.sleep(2)
            cap = cv2.VideoCapture(RTSP_URL, cv2.CAP_FFMPEG)
            cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)
            continue

        print(f"[{ts}] Cycle {cycle} — {len(slots)} places...", end=" ", flush=True)
        t0 = time.time()

        results = []
        for slot in slots:
            roi      = extract_roi(frame, slot)
            roi_norm = roi.astype(np.float32) / 255.0
            classe, prob = predict(
                roi_norm, hls1, hls2, in1, out1, in2, out2,
                W3_flat, B3, W4, B4, W5, B5
            )
            if prob < SEUIL:
                classe = 0
            results.append({'slot': len(results), 'classe': classe, 'prob': round(prob, 4)})

        dt        = time.time() - t0
        n_libre   = sum(1 for r in results if r['classe'] == 0)
        n_occupee = sum(1 for r in results if r['classe'] == 1)
        n_total   = len(results)
        print(f"{n_occupee} occupées / {n_libre} libres  ({dt:.1f}s)")

        # Dessiner
        vis = draw_results(frame, slots, results)

        # Image live
        cv2.imwrite("/tmp/result_live_tmp.png", vis)
        shutil.move("/tmp/result_live_tmp.png", OUT_IMAGE)

        # Archive horodatée
        archive_path = os.path.join(RESULTS_DIR, f"{ts_fn}_L{n_libre}_O{n_occupee}.png")
        cv2.imwrite(archive_path, vis)

        # JSON
        output = {
            "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
            "cycle":     cycle,
            "n_libre":   n_libre,
            "n_occupee": n_occupee,
            "seuil":     SEUIL,
            "places":    results
        }
        with open(OUT_JSON + ".tmp", "w") as f:
            json.dump(output, f, indent=2)
        os.replace(OUT_JSON + ".tmp", OUT_JSON)

        # Envoi série vers ESP32
        send_serial(ser, n_libre, n_total)

        time.sleep(INTERVAL_S)

    cap.release()
    if ser:
        ser.close()

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\nArrêt propre.")
