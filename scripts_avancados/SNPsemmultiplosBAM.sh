#!/bin/bash
# Esse script processa múltiplos arquivos BAM para identificar SNPs, verifica a existência dos arquivos e gera um relatório VCF para cada um.

# Variáveis
REFERENCE="genoma.fasta" # Genoma de referência
INPUT_DIR="bam_files"    # Diretório com arquivos BAM
OUTPUT_DIR="snp_results" # Diretório para os arquivos VCF
REPORT="snp_report.txt"  # Arquivo de relatório

# Verifica se o diretório de saída existe
mkdir -p $OUTPUT_DIR

# Inicia o relatório
echo "Relatório de análise de SNPs" > $REPORT
echo "Data: $(date)" >> $REPORT
echo "----------------------------------------" >> $REPORT

# Processa cada arquivo BAM no diretório
for BAM in $INPUT_DIR/*.bam; do
    if [ -f "$BAM" ]; then
        BASENAME=$(basename $BAM .bam)
        VCF_OUT="$OUTPUT_DIR/${BASENAME}_snps.vcf"
        echo "Analisando SNPs em $BAM..." >> $REPORT

        # Chama variantes (SNPs) e gera o arquivo VCF
        bcftools mpileup -f $REFERENCE $BAM | bcftools call -mv -Oz -o $VCF_OUT

        if [ $? -eq 0 ]; then
            echo "Análise de SNPs concluída para $BAM" >> $REPORT
        else
            echo "Erro na análise de SNPs para $BAM" >> $REPORT
        fi
    else
        echo "Arquivo $BAM não encontrado!" >> $REPORT
    fi
done

echo "Análise de SNPs concluída." >> $REPORT

