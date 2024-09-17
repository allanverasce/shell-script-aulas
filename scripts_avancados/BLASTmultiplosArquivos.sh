#!/bin/bash
# Este script executa BLAST em todos os arquivos FASTA em uma pasta, verificando a existência dos arquivos e gerando um relatório final.

# Definindo variáveis
DB="banco_de_dados"  # Nome do banco de dados BLAST
EVALUE="1e-5"        # Valor de corte de e-value
INPUT_DIR="fasta_files" # Diretório contendo os arquivos FASTA
OUTPUT_DIR="blast_results" # Diretório para salvar os resultados
REPORT="blast_report.txt"  # Arquivo de relatório final

# Verifica se o diretório de saída existe; caso contrário, cria-o
mkdir -p $OUTPUT_DIR

# Inicia o relatório
echo "Relatório de execução do BLAST" > $REPORT
echo "Data: $(date)" >> $REPORT
echo "----------------------------------------" >> $REPORT

# Itera sobre todos os arquivos FASTA no diretório
for FILE in $INPUT_DIR/*.fasta; do
    if [ -f "$FILE" ]; then
        BASENAME=$(basename $FILE .fasta)
        OUTPUT="$OUTPUT_DIR/${BASENAME}_blast.txt"
        echo "Executando BLAST para $FILE..." >> $REPORT

        # Executa o BLAST
        blastn -query $FILE -db $DB -out $OUTPUT -evalue $EVALUE -outfmt 6

        if [ $? -eq 0 ]; then
            echo "BLAST concluído para $FILE" >> $REPORT
        else
            echo "Erro no BLAST para $FILE" >> $REPORT
        fi
    else
        echo "Arquivo $FILE não encontrado!" >> $REPORT
    fi
done

echo "Processamento BLAST concluído." >> $REPORT

