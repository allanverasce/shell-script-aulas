#!/bin/bash

# Função que processa sequências de FASTA e calcula o número de sequências
contar_sequencias() {
  arquivo_fasta=$1
  grep -c "^>" "$arquivo_fasta"
}

# Exemplo de array com diferentes arquivos FASTA
arquivos_fasta=("amostra1.fasta" "amostra2.fasta" "amostra3.fasta")

# Itera sobre os arquivos e conta as sequências em cada um
for arquivo in "${arquivos_fasta[@]}"; do
  echo "Arquivo: $arquivo"
  contar_sequencias "$arquivo"
done

