#!/bin/bash
# Esse script identifica SNPs em um arquivo BAM e gera um VCF com as variantes.

# Variáveis
BAM="resultado.bam" # Arquivo BAM gerado após mapeamento
REFERENCE="genoma.fasta" # Genoma de referência
VCF_OUT="snps.vcf" # Arquivo de saída VCF com as variantes

# Etapas
# 1. Gerar um arquivo BCF com as variantes
bcftools mpileup -f $REFERENCE $BAM | bcftools call -mv -Oz -o $VCF_OUT

# 2. Indexar o arquivo VCF
bcftools index $VCF_OUT

# Fica atento a explicação dos comandos usados aqui!!!
# bcftools mpileup: gera a cobertura de bases do BAM em relação ao genoma de referência.
# bcftools call -mv: chama variantes (SNPs e indels).
# -Oz: compacta a saída no formato VCF.

