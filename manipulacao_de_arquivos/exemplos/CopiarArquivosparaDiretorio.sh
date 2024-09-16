#!/bin/bash

# Diretório de origem
origem="/caminho/para/arquivos"

# Diretório de backup
backup="/caminho/para/backup"

# Verifica se o diretório de backup existe, senão cria
if [ ! -d "$backup" ]; then
  mkdir -p "$backup"
fi

# Copia todos os arquivos .txt para o diretório de backup
cp "$origem"/*.txt "$backup"

echo "Arquivos .txt copiados para o backup com sucesso!"

