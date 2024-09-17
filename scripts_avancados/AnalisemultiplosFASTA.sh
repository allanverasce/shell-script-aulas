#!/bin/bash
# Este script processa vários arquivos FASTA, contando o número de sequências e identificando a mais longa em cada arquivo. Os resultados são registrados em um relatório.

# Diretório de entrada e arquivo de relatório
INPUT_DIR="fasta_files"
REPORT="fasta_report.txt"

# Inicia o relatório
echo "Relatório de análise de arquivos FASTA" > $REPORT
echo "Data: $(date)" >> $REPORT
echo "----------------------------------------" >> $REPORT

# Processa cada arquivo FASTA no diretório
for FILE in $INPUT_DIR/*.fasta; do
    if [ -f "$FILE" ]; then
        BASENAME=$(basename $FILE .fasta)
        echo "Analisando $FILE..." >> $REPORT

        # Conta o número de sequências
        seq_count=$(grep -c "^>" $FILE)
        echo "Número total de sequências em $FILE: $seq_count" >> $REPORT

        # Encontra a sequência mais longa
        longest_seq=$(awk '/^>/ {if (seqlen) {print seqlen}; seqlen=0; next} {seqlen += length($0)} END {print seqlen}' $FILE | sort -nr | head -1)
        echo "Comprimento da sequência mais longa: $longest_seq" >> $REPORT
        echo "----------------------------------------" >> $REPORT
    else
        echo "Arquivo $FILE não encontrado!" >> $REPORT
    fi
done

echo "Análise de arquivos FASTA concluída." >> $REPORT

