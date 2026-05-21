#!/usr/bin/env bash
# =============================================================
# run_all.sh - A executer DANS le conteneur Docker
#
# Pipeline complet :
#   1. Entrainement CNN (Keras)
#   2. Export poids .bin (ARM)
#   3. Export poids .h (FPGA headers)
#   4. Generation golden (donnees test HLS)
#   5. Vitis HLS conv1_pool1 (csim + csynth + export IP)
#   6. Vitis HLS conv2_pool2 (csim + csynth + export IP)
#   7. Vivado block design -> bitstream
#
# Usage (dans le conteneur) :
#   bash /app/run_all.sh
# =============================================================
set -Eeuo pipefail

readonly XILINX_BASE="${XILINX_BASE:-/tools/Xilinx}"
readonly XILINX_VERSION="${XILINX_VERSION:-2024.2}"
readonly APP_DIR="${APP_DIR:-/app}"
readonly OUTPUT_DIR="${OUTPUT_DIR:-/output}"
readonly LIBUDEV_PATH="/lib/x86_64-linux-gnu/libudev.so.1"
readonly LIBUDEV_BACKUP="${LIBUDEV_PATH}.backup"

log()  { printf '[%s] %s\n' "$(date -u +%FT%TZ)" "$*"; }
fail() { printf '[%s] ERROR: %s\n' "$(date -u +%FT%TZ)" "$*" >&2; exit 1; }

restore_libudev() {
    if [[ -f "${LIBUDEV_BACKUP}" ]]; then
        mv "${LIBUDEV_BACKUP}" "${LIBUDEV_PATH}"
        log "libudev restaure : ${LIBUDEV_PATH}"
    fi
}

on_exit() {
    local rc=$?
    restore_libudev
    if (( rc != 0 )); then
        log "Pipeline interrompu (code=${rc})"
    fi
    exit "${rc}"
}
trap on_exit EXIT
trap 'fail "Interrompu (ligne ${LINENO})"' ERR

require_file() {
    [[ -f "$1" ]] || fail "Fichier requis manquant : $1"
}

log "========================================================"
log "  SMART PARKING - Pipeline complet"
log "========================================================"

# --- Environnement Xilinx ---
log ""
log ">>> Chargement environnement Xilinx (version=${XILINX_VERSION})..."
require_file "${XILINX_BASE}/Vitis_HLS/${XILINX_VERSION}/settings64.sh"
# shellcheck disable=SC1090
source "${XILINX_BASE}/Vitis_HLS/${XILINX_VERSION}/settings64.sh"
export XILINX_VCXX="${XILINX_BASE}/Vitis/${XILINX_VERSION}/vcxx"
log "  XILINX_HLS  = ${XILINX_HLS:-<unset>}"
log "  XILINX_VCXX = ${XILINX_VCXX}"

# =============================================================
# ETAPE 1 : Entrainement
# =============================================================
log ""
log ">>> Etape 1/7 : Entrainement CNN..."
python3 "${APP_DIR}/scripts/train.py" "$@"

# =============================================================
# ETAPE 2 : Export poids .bin (ARM)
# =============================================================
log ""
log ">>> Etape 2/7 : Export poids .bin..."
python3 "${APP_DIR}/scripts/export_weights.py"

# =============================================================
# ETAPE 3 : Export poids .h (headers FPGA)
# =============================================================
log ""
log ">>> Etape 3/7 : Export poids -> headers C..."
python3 "${APP_DIR}/scripts/export_weights_h.py" --out-dir "${APP_DIR}/hls"

# =============================================================
# ETAPE 4 : Generation golden (test HLS)
# =============================================================
log ""
log ">>> Etape 4/7 : Generation donnees golden..."
python3 "${APP_DIR}/scripts/regen_golden.py" --out-dir "${APP_DIR}/hls"

# =============================================================
# ETAPE 5 : Vitis HLS conv1_pool1
# =============================================================
log ""
log ">>> Etape 5/7 : Vitis HLS conv1_pool1 (~15-20 min)..."
(
    cd "${APP_DIR}/hls/conv1_pool1"
    vitis_hls -f run_all.tcl
)

# =============================================================
# ETAPE 6 : Vitis HLS conv2_pool2
# =============================================================
log ""
log ">>> Etape 6/7 : Vitis HLS conv2_pool2 (~15-20 min)..."
(
    cd "${APP_DIR}/hls/conv2_pool2"
    vitis_hls -f run_all.tcl
)

# =============================================================
# Copier les IPs pour Vivado
# =============================================================
log ""
log ">>> Copie des IPs vers Vivado..."
mkdir -p "${APP_DIR}/vivado/ip_repo"

readonly IP1_SRC="${APP_DIR}/hls/conv1_pool1/hls_prj/solution1/impl/ip/xilinx_com_hls_conv1_pool1_1_0.zip"
readonly IP2_SRC="${APP_DIR}/hls/conv2_pool2/hls_prj/solution1/impl/ip/xilinx_com_hls_conv2_pool2_1_0.zip"
require_file "${IP1_SRC}"
require_file "${IP2_SRC}"

cp "${IP1_SRC}" "${APP_DIR}/vivado/ip_repo/conv1_pool1.zip"
cp "${IP2_SRC}" "${APP_DIR}/vivado/ip_repo/conv2_pool2.zip"
log "  IPs copiees"

# =============================================================
# ETAPE 7 : Vivado block design -> bitstream
# =============================================================
log ""
log ">>> Etape 7/7 : Vivado -> bitstream (~20-30 min)..."
require_file "${XILINX_BASE}/Vivado/${XILINX_VERSION}/settings64.sh"
# shellcheck disable=SC1090
source "${XILINX_BASE}/Vivado/${XILINX_VERSION}/settings64.sh"

# Fix crash libudev/realloc() de Vivado dans conteneur Docker.
# La restauration est garantie par le trap EXIT.
mkdir -p /run/udev
: > /run/udev/control
if [[ -f "${LIBUDEV_PATH}" && ! -f "${LIBUDEV_BACKUP}" ]]; then
    mv "${LIBUDEV_PATH}" "${LIBUDEV_BACKUP}"
fi

(
    cd "${APP_DIR}/vivado"
    vivado -mode batch -source create_vivado_2ips.tcl
)

restore_libudev

# Copier les resultats vers /output
mkdir -p "${OUTPUT_DIR}/bitstream"
if [[ -d "${APP_DIR}/vivado/pynq_output" ]]; then
    cp -v "${APP_DIR}/vivado/pynq_output/"* "${OUTPUT_DIR}/bitstream/" || true
else
    log "Avertissement : ${APP_DIR}/vivado/pynq_output absent"
fi

# =============================================================
# RESUME
# =============================================================
log ""
log "========================================================"
log "  PIPELINE TERMINE"
log "========================================================"
log "  ${OUTPUT_DIR}/models/parking_cnn.h5       <- modele Keras"
log "  ${OUTPUT_DIR}/weights/*.bin               <- poids ARM"
log "  ${OUTPUT_DIR}/bitstream/*.bit             <- bitstream FPGA"
log "  ${OUTPUT_DIR}/bitstream/*.hwh             <- hardware handoff"
log "========================================================"
log ""
log "  Copier sur la PYNQ-Z2 :"
log "    scp output/weights/*.bin xilinx@pynq:~/jupyter_notebooks/weights/"
log "    scp output/bitstream/*  xilinx@pynq:~/jupyter_notebooks/"
log "========================================================"
