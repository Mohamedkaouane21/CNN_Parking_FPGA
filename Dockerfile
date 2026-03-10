# =============================================================
# Smart Parking — Entraînement + Export + HLS + Bitstream
# =============================================================
# Basé sur Ubuntu 20.04 pour compatibilité maximale Vivado 2024.2
# =============================================================

FROM ubuntu:20.04

LABEL description="Smart Parking — CNN train + weight export + HLS + bitstream"

ENV DEBIAN_FRONTEND=noninteractive

# Dépendances système
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-dev \
        libgl1-mesa-glx \
        libglib2.0-0 \
        unzip \
        locales \
        libx11-6 \
        libxrender1 \
        libxext6 \
        libfreetype6 \
        libfontconfig1 \
        libtinfo5 \
        make \
        gcc \
        g++ \
        libc6-dev \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen

# Fake libudev pour éviter le crash realloc() de Vivado dans Docker
RUN gcc -shared -o /usr/lib/x86_64-linux-gnu/libudev_fake.so -x c /dev/null

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US:en

WORKDIR /app

# Dépendances Python
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Scripts Python
COPY scripts/ scripts/

# Sources HLS
COPY hls/ hls/

# Scripts Vivado
COPY vivado/ vivado/

# Script pipeline
COPY run_all.sh .
RUN chmod +x run_all.sh

# Créer les répertoires de sortie et udev
RUN mkdir -p /output/models /output/weights /output/bitstream /run/udev \
    && echo "" > /run/udev/control

# Volumes
VOLUME ["/data", "/output", "/tools"]

# Shell interactif par défaut
CMD ["bash"]