FROM conda/miniconda3

RUN conda install -c bioconda -c conda-forge fastqc samtools 

