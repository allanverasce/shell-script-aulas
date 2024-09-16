## Funções
### O que são Funções?
<p align="justify">Funções são blocos de código reutilizáveis que podem ser chamados em diferentes partes de um script. Elas permitem que você organize seu código em partes menores, tornando-o mais legível e modular. Funções são especialmente úteis em scripts longos ou que realizam tarefas repetitivas.</p>

Sintaxe de Funções:
```
nome_da_funcao() {
  # código da função
}
```
### Vamos ver um exemplo?
```
#!/bin/bash
# Definindo uma função
saudacao() {
  echo "Olá, $1! Seja bem-vindo(a)."
}
# Chamando a função
saudacao "Maria"
```
### Exemplo Aplicado à Biologia:
Um exemplo prático em bioinformática pode ser criar uma função que calcula o número de sequências em um arquivo FASTA.

```
#!/bin/bash

# Função que conta sequências em um arquivo FASTA
contar_sequencias() {
  arquivo_fasta=$1
  grep -c "^>" "$arquivo_fasta"
}

# Usando a função para contar sequências
contar_sequencias "sequencias.fasta"
```
### Dicas  do Allan para o uso de Funções:
- Use funções para evitar duplicação de código.
- Nomeie suas funções de forma descritiva para facilitar a compreensão do script. Lembra quanto mais fácil melhor !!!
- Sempre passe parâmetros para funções, se necessário, para torná-las mais versáteis.

## Arrays
### O que são Arrays?
<p align="justify">Arrays são estruturas de dados que permitem armazenar múltiplos valores em uma única variável. No Bash, arrays são úteis para armazenar listas de valores, como nomes de arquivos, sequências, ou resultados de análises.</p>

Vamos ver a Sintaxe dos Arrays:
```
# Definindo um array
meu_array=("valor1" "valor2" "valor3")

# Acessando elementos de um array
echo "${meu_array[0]}"  # valor1
```
Agora um exemplo mais prático

```
#!/bin/bash

# Definindo um array com nomes de frutas
frutas=("maçã" "banana" "laranja")

# Iterando sobre o array
for fruta in "${frutas[@]}"; do
  echo "Fruta: $fruta"
done
```

### Exemplo Aplicado à Biologia:
Imagine que você tem uma lista de amostras de sequenciamento e deseja processá-las. Um array pode armazenar os nomes das amostras.

```
#!/bin/bash

# Definindo um array com amostras de sequenciamento
amostras=("amostra1.fastq" "amostra2.fastq" "amostra3.fastq")

# Processando cada amostra
for amostra in "${amostras[@]}"; do
  echo "Processando $amostra..."
  # Comando de exemplo: alinhar amostra usando ferramenta de bioinformática
  bwa mem ref_genoma.fasta "$amostra" > "${amostra%.fastq}.sam"
done
```
### Fique ligado nas Dicas do Allan 
- Use arrays para armazenar listas de arquivos, amostras, ou resultados.
- Sempre lembre-se de usar "${array[@]}" para acessar todos os elementos do array.
- Evite usar arrays para armazenar grandes quantidades de dados; utilize arquivos ou banco de dados para esses casos.



