FROM gitpod/workspace-base:latest

USER root

RUN apt-get update --quiet && \
    apt-get install --quiet --yes --no-install-recommends \
    git \
    wget
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh 

RUN chown -R gitpod:gitpod /opt/conda
ENV PATH="/opt/conda/bin:$PATH"

# Change user to gitpod
USER gitpod
    
# Install nextflow
RUN conda config --add channels defaults && \
        conda config --add channels bioconda && \
        conda config --add channels conda-forge && \
        conda config --set channel_priority strict && \
        conda install --quiet --yes --name base \
        nextflow
