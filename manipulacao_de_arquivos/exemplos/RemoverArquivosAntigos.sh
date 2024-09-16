#Esse script remove arquivos mais antigos que um número específico de dias. Útil para limpar arquivos temporários ou antigos que não são mais necessários.
#Cuidado no uso... Apagou, apagou KKK

#!/bin/bash

# Diretório contendo os arquivos temporários
diretorio="/caminho/para/temporarios"

# Remove arquivos com mais de 30 dias
find "$diretorio" -type f -mtime +30 -exec rm {} \;

echo "Arquivos antigos removidos com sucesso!"

