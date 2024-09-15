#!/bin/bash
# Script com exemplos de comandos avançados

# Procurar por um padrão dentro de um arquivo
echo "Procurando pela palavra 'ERRO' no arquivo 'log.txt':"
grep "ERRO" log.txt

# Imprimir a primeira coluna de um arquivo
echo "Exibindo a primeira coluna do arquivo 'dados.csv':"
awk -F, '{print $1}' dados.csv

# Substituir todas as ocorrências de 'velho' por 'novo' em um arquivo
echo "Substituindo 'velho' por 'novo' no arquivo 'texto.txt':"
sed 's/velho/novo/g' texto.txt

