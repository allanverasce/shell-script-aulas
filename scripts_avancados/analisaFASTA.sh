#!/bin/bash
# Esse script conta o número de sequências em um arquivo FASTA e identifica a sequência mais longa.

# Variável de entrada
FASTA="sequencias.fasta"

# Contar o número de sequências no arquivo
seq_count=$(grep -c "^>" $FASTA)
echo "Número total de sequências: $seq_count"

# Encontrar a sequência mais longa
awk '/^>/ {if (seqlen) {print seqlen}; seqlen=0; next} {seqlen += length($0)} END {print seqlen}' $FASTA | sort -nr | head -1

# Explicando os comandos usados no script, se liga ai!
# grep "^>": busca cabeçalhos das sequências (linhas que começam com ">").
# awk: processa o arquivo para calcular o comprimento de cada sequência.
# sort -nr: organiza as sequências por comprimento (descendente).
# head -1: exibe o comprimento da maior sequência.

