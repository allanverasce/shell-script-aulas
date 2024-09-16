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
# Dicas para o uso de Funções:
- Use funções para evitar duplicação de código.
- Nomeie suas funções de forma descritiva para facilitar a compreensão do script. Lembra quanto mais fácil melhor !!!
- Sempre passe parâmetros para funções, se necessário, para torná-las mais versáteis.
