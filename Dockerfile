FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    perl \
    samtools \
    curl \
    wget \
    unzip \
    git \
    build-essential \
    default-jre \
    r-base \
    python3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

COPY MitoSAlt_1.1.1 ./MitoSAlt_1.1.1
COPY supervisor ./supervisor

CMD ["/bin/bash"]