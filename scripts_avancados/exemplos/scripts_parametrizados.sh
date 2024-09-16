#!/bin/bash

# Script que recebe o arquivo FASTA e o banco de dados como parâmetros para rodar BLAST
if [ "$#" -ne 2 ]; then
  echo "Uso: $0 <arquivo_fasta> <banco_dados>"
  exit 1
fi

arquivo_fasta=$1
banco_dados=$2

# Comando para executar BLAST
blastn -query "$arquivo_fasta" -db "$banco_dados" -out resultado_blast.txt

echo "BLAST finalizado. Resultado salvo em resultado_blast.txt."

