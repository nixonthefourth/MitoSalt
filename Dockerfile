FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
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
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

# Install required R packages
RUN R -e "install.packages(c('plotrix','RColorBrewer','BiocManager'), repos='https://cloud.r-project.org/')"

# Install Bioconductor package
RUN R -e "BiocManager::install('Biostrings', ask=FALSE, update=FALSE)"

# UCSC utility
RUN wget -q -O /usr/local/bin/bedGraphToBigWig \
    https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig \
 && chmod +x /usr/local/bin/bedGraphToBigWig

WORKDIR /opt

COPY MitoSAlt_1.1.1/ /opt/MitoSAlt_1.1.1/
COPY supervisor/MitoSAlt1.1.1_LR.pl \
     /opt/MitoSAlt_1.1.1/MitoSAlt1.1.1_LR.pl

COPY config_human_GE.txt \
     /opt/MitoSAlt_1.1.1/config_human_GE.txt

# Create output directories
RUN mkdir -p \
    /opt/MitoSAlt_1.1.1/bam \
    /opt/MitoSAlt_1.1.1/bw \
    /opt/MitoSAlt_1.1.1/indel \
    /opt/MitoSAlt_1.1.1/log \
    /opt/MitoSAlt_1.1.1/plot \
    /opt/MitoSAlt_1.1.1/tab

RUN chmod +x /opt/MitoSAlt_1.1.1/MitoSAlt1.1.1_LR.pl

CMD ["/bin/bash"]