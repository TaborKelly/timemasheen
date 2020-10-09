# Old enough to have python2 FUSE support is what we are really looking for
# because that is what tmfuse expects.
FROM debian:stable

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    build-essential \
    git \
    libfuse-dev \
    pkg-config \
    python-fuse && \
rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/torarnv/sparsebundlefs.git && \
    cd sparsebundlefs && \
    make && \
    cd ..

RUN git clone https://github.com/rpedde/tmfuse.git
