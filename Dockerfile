FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    perl \
    python3 \
    samtools \
    sambamba \
    last-align \
    bedtools \
    r-base \
    default-jre \
    build-essential \
    git \
    curl \
    wget \
    unzip \
    bash \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /usr/local/bin/bedGraphToBigWig \
    https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig && \
    chmod +x /usr/local/bin/bedGraphToBigWig

WORKDIR /opt

COPY MitoSAlt_1.1.1 ./MitoSAlt_1.1.1
COPY supervisor ./supervisor

CMD ["/bin/bash"]