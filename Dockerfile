FROM ubuntu:18.04
MAINTAINER muabnesor <adam.rosenbaum@umu.se>

LABEL description="Image for VEP 100.2"

ENV VEP_VERSION=100.2
ENV MINICONDA_VERSION latest 

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    build-essential \
    libncurses5-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl3-dev && \
    apt-get clean && apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget  --no-check-certificate https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh 
RUN chmod +x Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh
RUN bash Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p /usr/miniconda3
ENV PATH /usr/miniconda3/bin:$PATH 

RUN conda install -c bioconda ensembl-vep=${VEP_VERSION}
RUN perl usr/miniconda3/bin/vep_install -a p --PLUGINS StructuralVariantOverlap,SpliceAI

