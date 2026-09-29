# rMVP 1.4.6 container
# Tag must match conda version: quay.io/bioinfortools/rmvp:1.4.6
FROM public.ecr.aws/docker/library/ubuntu:22.04

LABEL org.opencontainers.image.title="rmvp" \
      org.opencontainers.image.version="1.4.6" \
      org.opencontainers.image.description="rMVP GWAS via conda-forge r-rmvp=1.4.6" \
      org.opencontainers.image.source="https://github.com/SiYangming/rMVP"

ENV DEBIAN_FRONTEND=noninteractive \
    MAMBA_ROOT_PREFIX=/opt/conda \
    PATH=/opt/conda/bin:$PATH

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl bzip2 ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj -C /usr/local/bin --strip-components=1 bin/micromamba \
    && micromamba create -y -p /opt/conda \
         -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge \
         -c conda-forge \
         "r-rmvp=1.4.6" \
    && micromamba clean -a -y \
    && ln -sf /opt/conda/bin/R /usr/local/bin/R \
    && ln -sf /opt/conda/bin/Rscript /usr/local/bin/Rscript

WORKDIR /data
