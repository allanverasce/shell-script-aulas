#!/bin/bash
# O seguinte script mapeia leituras usando o BWA e gera um arquivo BAM após o mapeamento.

# Variáveis
GENOME="genoma.fasta" # Genoma de referência
READS="leituras.fastq" # Arquivo FASTQ com as leituras de sequenciamento
OUT="resultado.bam" # Arquivo de saída em formato BAM

# Etapas
# 1. Indexar o genoma de referência
bwa index $GENOME

# 2. Mapeamento
bwa mem $GENOME $READS | samtools view -Sb - > $OUT

# Comentários:
# O comando `bwa mem` faz o mapeamento das leituras FASTQ ao genoma de referência.
# O `samtools view -Sb -` converte a saída do mapeamento para o formato BAM.

