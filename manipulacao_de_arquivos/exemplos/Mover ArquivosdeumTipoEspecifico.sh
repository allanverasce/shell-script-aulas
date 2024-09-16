#Aqui está um script que move todos os arquivos .fasta para um diretório específico, útil para organizar dados biológicos.

#!/bin/bash

# Diretório de origem e destino
origem="/caminho/para/arquivos"
destino="/caminho/para/fasta"

# Verifica se o diretório de destino existe, senão cria
if [ ! -d "$destino" ]; then
  mkdir -p "$destino"
fi

# Move todos os arquivos .fasta para o diretório de destino
mv "$origem"/*.fasta "$destino"

echo "Arquivos .fasta movidos para o diretório $destino com sucesso!"

