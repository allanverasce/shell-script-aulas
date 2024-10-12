# Funções e Modularidade em Shell Script (Achou que não dava pra fazer em shell, né?)
## Definindo e Utilizando Funções
<p align="justify">As funções em Shell Script são blocos de código reutilizáveis que permitem uma organização modular de scripts, facilitando a manutenção e a execução de tarefas repetitivas. Elas são especialmente úteis em bioinformática para automatizar procedimentos comuns, como processamento de sequências de DNA, conversão de formatos de arquivos, entre outros.</p>

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
- nome_da_funcao: Nome dado à função, que será usado para chamá-la.
- return: Retorna um valor de saída da função (0 indica sucesso e qualquer outro valor indica erro). Opcional, mas útil quando se quer verificar o sucesso da execução.
- A função pode ser chamada posteriormente no código pelo seu nome.
Exemplo: Função de Soma Simples

```
#!/bin/bash

# Definindo uma função que realiza a soma de dois números
soma() {
  resultado=$(( $1 + $2 )) # $1 e $2 são os parâmetros passados
  echo "A soma de $1 e $2 é: $resultado"
}

# Chamando a função
soma 5 10
```

## Passagem de Parâmetros e Valores de Retorno
<p align="justify">As funções podem receber parâmetros e devolver valores. Para passar parâmetros, você os fornece após o nome da função quando ela é chamada, e dentro da função você pode acessá-los com as variáveis $1, $2, etc., que correspondem aos parâmetros na ordem que foram passados.</p>

Exemplo: Verificação de Arquivo
```
#!/bin/bash

# Função que verifica se um arquivo existe
verifica_arquivo() {
  if [[ -f $1 ]]; then
    echo "O arquivo $1 existe."
    return 0 # Retorno 0 indica sucesso
  else
    echo "O arquivo $1 não existe."
    return 1 # Retorno 1 indica falha
  fi
}

# Chamando a função com um argumento
verifica_arquivo "meu_arquivo.txt"
```
### Explicando a função
- A função verifica_arquivo recebe um parâmetro, que é o nome do arquivo a ser verificado.
- Ela retorna 0 se o arquivo existir e 1 caso contrário.
- O valor retornado pode ser usado em verificações subsequentes.

Exemplo: Função para Calcular o Conteúdo GC de Sequências de DNA
O conteúdo GC de uma sequência de DNA é a porcentagem de bases guanina (G) e citosina (C) em relação ao total de bases. Vamos criar uma função que calcula isso.
`Note que o código ficou mais limpo e simples`
```
#!/bin/bash

# Função para calcular o conteúdo GC de uma sequência de DNA
calcula_gc() {
  sequencia=$(echo $1 | tr 'a-z' 'A-Z') # Converte a sequência para maiúsculas
  total_bases=${#sequencia} # Obtém o comprimento da sequência
  gc_bases=$(echo $sequencia | grep -o '[GC]' | wc -l) # Conta as bases G e C
  gc_percent=$(echo "scale=2; ($gc_bases / $total_bases) * 100" | bc) # Calcula o percentual
  echo "Conteúdo GC da sequência: $gc_percent%"
}

# Chamando a função com uma sequência de exemplo
calcula_gc "ATGCGCATTAGC"
```

Função para Gerar a Sequência Complementar de DNA
Esta função gera a sequência complementar de uma cadeia de DNA, trocando os pares de bases A-T e C-G.
```
#!/bin/bash

# Função para gerar a sequência complementar de DNA
complemento_dna() {
  sequencia=$(echo $1 | tr 'a-z' 'A-Z')
  complemento=$(echo $sequencia | tr 'ATCG' 'TAGC')
  echo "Sequência original: $sequencia"
  echo "Sequência complementar: $complemento"
}

# Chamando a função com uma sequência de exemplo
complemento_dna "ATGCGCATTAGC"
```

<p align="justify">O comando tr no Linux é utilizado para traduzir, substituir ou remover caracteres de uma entrada padrão (geralmente a saída de outro comando ou texto inserido diretamente). Ele lê do stdin (entrada padrão) e escreve para o stdout (saída padrão), sendo muito útil em operações de manipulação de texto.</p>

Sintaxe básica:
```
tr [opções] SET1 [SET2]
```
- SET1: Conjunto de caracteres que será transformado, removido ou substituído.
- SET2: Conjunto de caracteres que substituirá os caracteres de SET1. Se não for especificado, o comando tr apenas removerá ou manipulará os caracteres definidos por SET1.
Opções comuns:
- -d: Remove os caracteres que correspondem ao SET1.
- -s: Substitui sequências repetidas de caracteres por um único caractere.
- -c: Complementa o SET1, ou seja, aplica o comando a todos os caracteres que não estão em SET1.
  
