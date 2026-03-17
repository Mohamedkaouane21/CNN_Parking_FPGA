# Smart Parking — Pipeline complet (Docker)

## Ce que fait ce projet

Reproduit entièrement le build du système Smart Parking PYNQ-Z2 dans un conteneur Docker :
entraînement du CNN, export des poids, synthèse HLS des IP FPGA, et génération du bitstream.

## Pipeline

```
Étape 1  Train CNN (Keras)              → parking_cnn.h5           (~2 min)
Étape 2  Export poids .bin (ARM)        → weights/*.bin
Étape 3  Export poids .h (FPGA)         → weights.h, weights2.h
Étape 4  Génération golden (test HLS)   → données test csim
Étape 5  Vitis HLS conv1_pool1          → IP conv1                (~15-20 min)
Étape 6  Vitis HLS conv2_pool2          → IP conv2                (~15-20 min)
Étape 7  Vivado block design            → design_1_wrapper.bit    (~20-30 min)
```

Temps total : environ 1 heure.

## Prérequis

- Docker installé sur la machine hôte
- **Vitis HLS 2024.2** installé sur la machine hôte
- **Vivado 2024.2** installé sur la machine hôte
- Dataset d'images 48×48 grayscale (dossiers `empty/` et `occupied/`)

Les outils Xilinx sont montés en volume dans le conteneur (pas besoin de les installer dans l'image Docker).


## Dataset

Le dataset utilisé pour l'entraînement du modèle CNN est disponible ici :

https://drive.google.com/drive/u/2/folders/0AKBWix9Uk1aHUk9PVA


Structure attendue :

dataset/
├── empty/
│   ├── img1.png
│   ├── img2.png
│   └── ...
└── occupied/
    ├── img1.png
    ├── img2.png
    └── ...

Images : 48×48 pixels (grayscale)

## Structure du projet

```
smart_parking/
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── run_all.sh                    ← script pipeline (à lancer dans le conteneur)
├── scripts/
│   ├── train.py                  ← entraînement CNN
│   ├── export_weights.py         ← poids → .bin (ARM)
│   ├── export_weights_h.py       ← poids → .h (FPGA)
│   └── regen_golden.py           ← données test HLS
├── hls/
│   ├── conv1_pool1/
│   │   ├── run_all.tcl
│   │   └── src/
│   │       ├── conv1_pool1.cpp
│   │       └── tb_conv1_pool1.cpp
│   └── conv2_pool2/
│       ├── run_all.tcl
│       └── src/
│           ├── conv2_pool2.cpp
│           └── tb_conv2_pool2.cpp
├── vivado/
│   └── create_vivado_2ips.tcl
├── dataset/                       ← ton dataset (monté en volume)
│   ├── empty/
│   └── occupied/
└── output/                        ← résultats (monté en volume)
    ├── models/parking_cnn.h5
    ├── weights/*.bin
    └── bitstream/*.bit, *.hwh
```

## Utilisation

### 1. Préparer le dataset

```bash
mkdir -p dataset/empty dataset/occupied output
# Copier les images 48×48 dans les bons dossiers
```

### 2. Build l'image Docker

```bash
docker compose build
```

### 3. Lancer le conteneur

```bash
docker compose run smart-parking
```

Cela ouvre un shell bash dans le conteneur.

### 4. Lancer le pipeline

**Option A — Tout d'un coup (~1h) :**

```bash
bash /app/run_all.sh
```

Le script gère automatiquement :
- Le sourcing de Vitis HLS et Vivado
- L'export de XILINX_VCXX pour le compilateur CLANG
- Le fix libudev pour Vivado dans Docker

**Option B — Étape par étape (pour debug) :**

```bash
# 1. Charger l'environnement Xilinx
source /tools/Xilinx/Vitis_HLS/2024.2/settings64.sh
export XILINX_VCXX=/tools/Xilinx/Vitis/2024.2/vcxx

# 2. Train + Export (~2 min)
python3 /app/scripts/train.py
python3 /app/scripts/export_weights.py
python3 /app/scripts/export_weights_h.py --out-dir /app/hls
python3 /app/scripts/regen_golden.py --out-dir /app/hls

# 3. HLS conv1 (~15-20 min)
cd /app/hls/conv1_pool1 && vitis_hls -f run_all.tcl

# 4. HLS conv2 (~15-20 min)
cd /app/hls/conv2_pool2 && vitis_hls -f run_all.tcl

# 5. Copier les IPs pour Vivado
mkdir -p /app/vivado/ip_repo
cp /app/hls/conv1_pool1/hls_prj/solution1/impl/ip/xilinx_com_hls_conv1_pool1_1_0.zip /app/vivado/ip_repo/conv1_pool1.zip
cp /app/hls/conv2_pool2/hls_prj/solution1/impl/ip/xilinx_com_hls_conv2_pool2_1_0.zip /app/vivado/ip_repo/conv2_pool2.zip

# 6. Charger Vivado + fix Docker
source /tools/Xilinx/Vivado/2024.2/settings64.sh
mkdir -p /run/udev && echo "" > /run/udev/control
mv /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.1.backup

# 7. Générer le bitstream (~20-30 min)
cd /app/vivado && vivado -mode batch -source create_vivado_2ips.tcl

# 8. Restaurer libudev + copier résultats
mv /lib/x86_64-linux-gnu/libudev.so.1.backup /lib/x86_64-linux-gnu/libudev.so.1
mkdir -p /output/bitstream
cp /app/vivado/pynq_output/* /output/bitstream/
```

### 5. Sortir du conteneur

```bash
exit
```

Les résultats sont dans `./output/` :

```
output/
├── models/parking_cnn.h5
├── weights/
│   ├── weights3_from_hls.bin      ← Conv3 weights (ARM)
│   ├── biases3_from_hls.bin       ← Conv3 biases (ARM)
│   ├── 03_dense_w0.bin            ← Dense1 weights
│   ├── 03_dense_w1.bin            ← Dense1 biases
│   ├── 04_dense_1_w0.bin          ← Dense2 weights
│   └── 04_dense_1_w1.bin          ← Dense2 biases
└── bitstream/
    ├── design_1_wrapper.bit       ← bitstream FPGA
    └── design_1_wrapper.hwh       ← hardware handoff
```

### 6. Copier sur la PYNQ-Z2

```bash
scp output/weights/weights3_from_hls.bin  xilinx@pynq:~/jupyter_notebooks/
scp output/weights/biases3_from_hls.bin   xilinx@pynq:~/jupyter_notebooks/
scp output/weights/03_dense_w0.bin        xilinx@pynq:~/jupyter_notebooks/weights/
scp output/weights/03_dense_w1.bin        xilinx@pynq:~/jupyter_notebooks/weights/
scp output/weights/04_dense_1_w0.bin      xilinx@pynq:~/jupyter_notebooks/weights/
scp output/weights/04_dense_1_w1.bin      xilinx@pynq:~/jupyter_notebooks/weights/
scp output/bitstream/design_1_wrapper.bit xilinx@pynq:~/jupyter_notebooks/
scp output/bitstream/design_1_wrapper.hwh xilinx@pynq:~/jupyter_notebooks/
```

Puis lancer `parking_live.py` sur la PYNQ-Z2.

## Configuration

### Chemin Xilinx différent

Si Vitis/Vivado ne sont pas dans `/tools/Xilinx`, modifier `docker-compose.yml` :

```yaml
volumes:
  - /votre/chemin/Xilinx:/tools/Xilinx:ro
```

### Options d'entraînement

```bash
python3 /app/scripts/train.py --epochs 50 --batch-size 16 --val-split 0.3
```

Ou avec le script complet :

```bash
bash /app/run_all.sh --epochs 50 --batch-size 16
```

## Notes techniques

### Environnements Xilinx à sourcer

Le script `run_all.sh` gère tout automatiquement, mais pour référence :

- **Vitis HLS** : `source /tools/Xilinx/Vitis_HLS/2024.2/settings64.sh`
- **Vivado** : `source /tools/Xilinx/Vivado/2024.2/settings64.sh`
- **XILINX_VCXX** : `export XILINX_VCXX=/tools/Xilinx/Vitis/2024.2/vcxx` (compilateur CLANG pour csim)

### Fix Vivado dans Docker

Vivado crash dans les conteneurs Docker à cause d'une incompatibilité libudev.
Le fix consiste à renommer temporairement `/lib/x86_64-linux-gnu/libudev.so.1`
avant de lancer Vivado, puis la restaurer après. C'est géré automatiquement
par `run_all.sh`.

## Architecture CNN

```
Input 48×48×1
  → Conv2D(16, 3×3) + ReLU + MaxPool(2×2)    [FPGA - conv1_pool1]
  → Conv2D(32, 3×3) + ReLU + MaxPool(2×2)    [FPGA - conv2_pool2]
  → Conv2D(64, 3×3) + ReLU                   [ARM  - NumPy]
  → Flatten (4096)
  → Dense(128) + ReLU                        [ARM  - NumPy]
  → Dense(2) + Softmax                       [ARM  - NumPy]
```
