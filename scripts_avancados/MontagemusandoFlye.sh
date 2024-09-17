#!/bin/bash
# O script abaixo automatiza a montagem de genomas longos (PacBio ou Nanopore) com o Flye.

# Variáveis
READS="leituras_nanopore.fastq.gz" # Arquivo FASTQ das leituras longas
OUT_DIR="flye_output" # Diretório de saída para os arquivos de montagem
GENOME_SIZE="5m" # Tamanho estimado do genoma (5 Mb neste exemplo)

# Executando Flye
flye --nano-raw $READS --out-dir $OUT_DIR --genome-size $GENOME_SIZE --threads 8

# Explicação do que foi usado aqui. Você pode personalizar seu script.:
# --nano-raw: arquivo de entrada com as leituras longas.
# --out-dir: define o diretório de saída.
# --genome-size: tamanho estimado do genoma (necessário para Flye).
# --threads: número de threads para acelerar o processo.

