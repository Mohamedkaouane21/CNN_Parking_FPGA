# =============================================================
# Smart Parking - Entrainement + Export + HLS + Bitstream
# =============================================================
# Base Ubuntu 20.04 pour compatibilite maximale Vivado 2024.2
# =============================================================

FROM ubuntu:20.04

LABEL org.opencontainers.image.title="smart-parking" \
      org.opencontainers.image.description="CNN train + weight export + HLS + bitstream" \
      org.opencontainers.image.licenses="MIT"

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US:en

# Dependances systeme (toolchain + libs runtime Vivado/Vitis HLS)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
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
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Fake libudev pour eviter le crash realloc() de Vivado dans Docker
RUN gcc -shared -o /usr/lib/x86_64-linux-gnu/libudev_fake.so -x c /dev/null

WORKDIR /app

# Dependances Python
COPY requirements.txt ./
RUN python3 -m pip install --no-cache-dir --upgrade pip \
    && python3 -m pip install --no-cache-dir -r requirements.txt

# Scripts Python
COPY scripts/ scripts/

# Sources HLS
COPY hls/ hls/

# Scripts Vivado
COPY vivado/ vivado/

# Script pipeline
COPY run_all.sh ./
RUN chmod +x run_all.sh

# Repertoires de sortie et udev
RUN mkdir -p /output/models /output/weights /output/bitstream /run/udev \
    && : > /run/udev/control

VOLUME ["/data", "/output", "/tools"]

CMD ["bash"]
