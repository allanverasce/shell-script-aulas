#!/bin/bash
# Não esquece de instalar o fastqc -->  sudo apt install fastqc
# Diretório onde os arquivos FASTQ estão armazenados
FASTQ_DIR="/home/allan/fastq" # Aqui você ajusta para o seu diretório
# Diretório onde os relatórios de qualidade serão armazenados
OUTPUT_DIR="/home/allan/fastq/result" # O mesmo aqui, ajusta para o diretório no seu computador

# Verifica se o FastQC está instalado
if ! command -v fastqc &> /dev/null; then
    echo "FastQC não está instalado. Instale-o antes de rodar este script."
    exit 1
fi

# Cria o diretório de saída, caso não exista
mkdir -p "$OUTPUT_DIR"

# Loop pelos arquivos FASTQ e executa o FastQC em cada um deles
for fastq_file in "$FASTQ_DIR"/*.fastq; do
    echo "Processando arquivo: $fastq_file"

    # Executa o FastQC e armazena os relatórios no diretório de saída
    fastqc "$fastq_file" -o "$OUTPUT_DIR"

    # Verifica se o comando FastQC foi executado com sucesso
    if [ $? -eq 0 ]; then
        echo "Análise de qualidade de $fastq_file concluída com sucesso."
    else
        echo "Erro ao processar $fastq_file."
    fi
done

echo "Todas as análises de qualidade foram concluídas. Só correr pro abraço!!!"
