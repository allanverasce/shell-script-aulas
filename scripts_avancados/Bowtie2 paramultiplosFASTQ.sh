#!/bin/bash
# O script abaixo realiza o mapeamento com Bowtie2 para vários pares de arquivos FASTQ e gera um relatório com os resultados.

# Variáveis
INDEX="genoma_index"    # Índice do genoma gerado previamente
INPUT_DIR="fastq_files" # Diretório contendo os arquivos FASTQ
OUTPUT_DIR="bowtie2_results" # Diretório para salvar os resultados
REPORT="bowtie2_report.txt"   # Arquivo de relatório

# Verifica se o diretório de saída existe; caso contrário, cria-o
mkdir -p $OUTPUT_DIR

# Inicia o relatório
echo "Relatório de mapeamento Bowtie2" > $REPORT
echo "Data: $(date)" >> $REPORT
echo "----------------------------------------" >> $REPORT

# Mapeia os arquivos FASTQ em pares
for READ1 in $INPUT_DIR/*_1.fastq; do
    READ2=${READ1/_1.fastq/_2.fastq}
    if [ -f "$READ1" ] && [ -f "$READ2" ]; then
        BASENAME=$(basename $READ1 _1.fastq)
        OUTPUT="$OUTPUT_DIR/${BASENAME}_map.sam"
        echo "Executando Bowtie2 para $READ1 e $READ2..." >> $REPORT

        # Executa o mapeamento
        bowtie2 -x $INDEX -1 $READ1 -2 $READ2 -S $OUTPUT

        if [ $? -eq 0 ]; then
            echo "Mapeamento concluído para $READ1 e $READ2" >> $REPORT
        else
            echo "Erro no mapeamento para $READ1 e $READ2" >> $REPORT
        fi
    else
        echo "Arquivos $READ1 e/ou $READ2 não encontrados!" >> $REPORT
    fi
done

echo "Mapeamento Bowtie2 concluído." >> $REPORT

