#Se você tiver vários arquivos que precisam ser renomeados, como adicionar um prefixo ou sufixo, este script pode ser útil.
#No exemplo abaixo, ele adiciona o sufixo _old a todos os arquivos .fasta em um diretório.

#!/bin/bash

# Diretório contendo os arquivos
diretorio="/caminho/para/arquivos_fasta"

# Percorre todos os arquivos .fasta no diretório e adiciona o sufixo "_old"
for arquivo in "$diretorio"/*.fasta; do
  mv "$arquivo" "${arquivo%.fasta}_old.fasta"
done

echo "Arquivos renomeados com sucesso!"
