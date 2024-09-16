#!/bin/bash

# Diretório para listar arquivos
diretorio="/caminho/para/arquivos"

# Lista os arquivos com detalhes e redireciona para um relatório
ls -lh "$diretorio" > relatorio_arquivos.txt

echo "Relatório de arquivos gerado em relatorio_arquivos.txt"

