# Old enough to have python2 FUSE support is what we are really looking for
# because that is what tmfuse expects.
FROM debian:buster

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    build-essential \
    git \
    libfuse-dev \
    parted \
    pkg-config \
    python-fuse \
    rsync \
    vim && \
rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/torarnv/sparsebundlefs.git && \
    cd sparsebundlefs && \
    make && \
    cd ..

RUN git clone https://github.com/rpedde/tmfuse.git

RUN echo "alias ll='ls $LS_OPTIONS -la'" >> /root/.bashrc && \
    mkdir /output && \
    mkdir /mnt/disk && \
    mkdir /mnt/dmg && \
    mkdir /mnt/sparsebundle && \
    mkdir /mnt/translated

COPY assets/* /
