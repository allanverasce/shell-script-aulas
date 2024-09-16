#!/bin/bash

# Exemplo de redirecionamento simples
# Escrevendo em um arquivo
echo "Sequência de DNA" > dna.txt

# Anexando mais informações ao arquivo
echo "ATGCGTACGTAGCTAG" >> dna.txt
echo "GCTAGCTAGCTAGCTA" >> dna.txt

# Usando redirecionamento de entrada
# Contando o número de linhas no arquivo
wc -l < dna.txt

# Filtrando sequências que contêm "ATG" e salvando em outro arquivo
grep "ATG" dna.txt > sequencias_com_ATG.txt

