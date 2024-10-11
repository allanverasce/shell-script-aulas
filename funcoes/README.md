# Funções e Modularidade em Shell Script (Achou que não dava pra fazer em shell, né?)
## Definindo e Utilizando Funções
As funções em Shell Script são blocos de código reutilizáveis que permitem uma organização modular de scripts, facilitando a manutenção e a execução de tarefas repetitivas. Elas são especialmente úteis em bioinformática para automatizar procedimentos comuns, como processamento de sequências de DNA, conversão de formatos de arquivos, entre outros.

### Vantagens das Funções:
- Reutilização de código: O mesmo bloco de código pode ser reutilizado várias vezes sem duplicação.
- Organização: Funções tornam scripts mais organizados, modularizando partes do código.
- Facilidade de manutenção: Alterações em uma função afetam todo o código que a utiliza, o que facilita ajustes.

Sintaxe Básica
A estrutura básica de uma função em Shell Script é a seguinte:
```
nome_da_funcao() {
  # Bloco de comandos da função
  comando1
  comando2
  return valor # (opcional)
}
```
