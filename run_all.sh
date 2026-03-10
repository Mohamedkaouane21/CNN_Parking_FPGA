#!/bin/bash
# =============================================================
# run_all.sh — À exécuter DANS le conteneur Docker
#
# Pipeline complet :
#   1. Entraînement CNN (Keras)
#   2. Export poids .bin (ARM)
#   3. Export poids .h (FPGA headers)
#   4. Génération golden (données test HLS)
#   5. Vitis HLS conv1_pool1 (csim + csynth + export IP)
#   6. Vitis HLS conv2_pool2 (csim + csynth + export IP)
#   7. Vivado block design → bitstream
#
# Usage (dans le conteneur) :
#   bash /app/run_all.sh
# =============================================================
set -e

echo "========================================================"
echo "  SMART PARKING — Pipeline complet"
echo "========================================================"

# --- Environnement Xilinx ---
XILINX_BASE=${XILINX_BASE:-/tools/Xilinx}
echo ""
echo ">>> Chargement environnement Xilinx..."
source ${XILINX_BASE}/Vitis_HLS/2024.2/settings64.sh
export XILINX_VCXX=${XILINX_BASE}/Vitis/2024.2/vcxx
echo "  XILINX_HLS  = $XILINX_HLS"
echo "  XILINX_VCXX = $XILINX_VCXX"

# =============================================================
# ÉTAPE 1 : Entraînement
# =============================================================
echo ""
echo ">>> Étape 1/7 : Entraînement CNN..."
python3 /app/scripts/train.py "$@"

# =============================================================
# ÉTAPE 2 : Export poids .bin (ARM)
# =============================================================
echo ""
echo ">>> Étape 2/7 : Export poids .bin..."
python3 /app/scripts/export_weights.py

# =============================================================
# ÉTAPE 3 : Export poids .h (headers FPGA)
# =============================================================
echo ""
echo ">>> Étape 3/7 : Export poids → headers C..."
python3 /app/scripts/export_weights_h.py --out-dir /app/hls

# =============================================================
# ÉTAPE 4 : Génération golden (test HLS)
# =============================================================
echo ""
echo ">>> Étape 4/7 : Génération données golden..."
python3 /app/scripts/regen_golden.py --out-dir /app/hls

# =============================================================
# ÉTAPE 5 : Vitis HLS conv1_pool1
# =============================================================
echo ""
echo ">>> Étape 5/7 : Vitis HLS conv1_pool1 (~15-20 min)..."
cd /app/hls/conv1_pool1
vitis_hls -f run_all.tcl

# =============================================================
# ÉTAPE 6 : Vitis HLS conv2_pool2
# =============================================================
echo ""
echo ">>> Étape 6/7 : Vitis HLS conv2_pool2 (~15-20 min)..."
cd /app/hls/conv2_pool2
vitis_hls -f run_all.tcl

# =============================================================
# Copier les IPs pour Vivado
# =============================================================
echo ""
echo ">>> Copie des IPs vers Vivado..."
mkdir -p /app/vivado/ip_repo
cp /app/hls/conv1_pool1/hls_prj/solution1/impl/ip/xilinx_com_hls_conv1_pool1_1_0.zip /app/vivado/ip_repo/conv1_pool1.zip
cp /app/hls/conv2_pool2/hls_prj/solution1/impl/ip/xilinx_com_hls_conv2_pool2_1_0.zip /app/vivado/ip_repo/conv2_pool2.zip
echo "  ✅ IPs copiées"

# =============================================================
# ÉTAPE 7 : Vivado block design → bitstream
# =============================================================
echo ""
echo ">>> Étape 7/7 : Vivado → bitstream (~20-30 min)..."
source ${XILINX_BASE}/Vivado/2024.2/settings64.sh

# Fix crash libudev/realloc() de Vivado dans conteneur Docker
mkdir -p /run/udev
echo "" > /run/udev/control
# Désactiver libudev qui cause le crash realloc() dans Docker
if [ -f /lib/x86_64-linux-gnu/libudev.so.1 ]; then
    mv /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.1.backup
fi

cd /app/vivado
vivado -mode batch -source create_vivado_2ips.tcl

# Restaurer libudev après Vivado
if [ -f /lib/x86_64-linux-gnu/libudev.so.1.backup ]; then
    mv /lib/x86_64-linux-gnu/libudev.so.1.backup /lib/x86_64-linux-gnu/libudev.so.1
fi

# Copier les résultats vers /output
mkdir -p /output/bitstream
cp -v /app/vivado/pynq_output/* /output/bitstream/ 2>/dev/null || true

# =============================================================
# RÉSUMÉ
# =============================================================
echo ""
echo "========================================================"
echo "  PIPELINE TERMINÉ"
echo "========================================================"
echo "  /output/models/parking_cnn.h5       ← modèle Keras"
echo "  /output/weights/*.bin               ← poids ARM"
echo "  /output/bitstream/*.bit             ← bitstream FPGA"
echo "  /output/bitstream/*.hwh             ← hardware handoff"
echo "========================================================"
echo ""
echo "  Copier sur la PYNQ-Z2 :"
echo "    scp output/weights/*.bin xilinx@pynq:~/jupyter_notebooks/weights/"
echo "    scp output/bitstream/*  xilinx@pynq:~/jupyter_notebooks/"
echo "========================================================"