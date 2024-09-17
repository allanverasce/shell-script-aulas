#!/bin/bash
# Este script processa múltiplos arquivos FASTQ com BWA, verifica a existência dos arquivos e gera um relatório.

# Variáveis
GENOME="genoma.fasta"  # Genoma de referência
INPUT_DIR="fastq_files" # Diretório com arquivos FASTQ
OUTPUT_DIR="bwa_results" # Diretório para arquivos de saída
REPORT="bwa_report.txt"  # Arquivo de relatório

# Verifica se o diretório de saída existe
mkdir -p $OUTPUT_DIR

# Inicia o relatório
echo "Relatório de mapeamento BWA" > $REPORT
echo "Data: $(date)" >> $REPORT
echo "----------------------------------------" >> $REPORT

# Indexar o genoma
bwa index $GENOME

# Itera sobre todos os arquivos FASTQ
for READS in $INPUT_DIR/*.fastq; do
    if [ -f "$READS" ]; then
        BASENAME=$(basename $READS .fastq)
        OUTPUT="$OUTPUT_DIR/${BASENAME}.bam"
        echo "Executando BWA para $READS..." >> $REPORT

        # Executa o mapeamento e conversão para BAM
        bwa mem $GENOME $READS | samtools view -Sb - > $OUTPUT

        if [ $? -eq 0 ]; then
            echo "Mapeamento concluído para $READS" >> $REPORT
        else
            echo "Erro no mapeamento para $READS" >> $REPORT
        fi
    else
        echo "Arquivo $READS não encontrado!" >> $REPORT
    fi
done

echo "Mapeamento BWA concluído." >> $REPORT

