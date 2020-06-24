FROM continuumio/miniconda3:4.7.12
MAINTAINER muabnesor <adam.rosenbaum@umu.se>

LABEL description="Image for VEP 100.2"

ENV VEP_VERSION=100.2

RUN conda install -c bioconda ensembl-vep=${VEP_VERSION}
RUN vep_install -a p --PLUGINS StructuralVariantOverlap,SpliceAI


