# Bora falar um pouco sobre o AWK?
<p align="justify"> O awk é uma poderosa ferramenta de processamento de texto em sistemas Unix/Linux, amplamente utilizada para análise, manipulação e extração de dados de arquivos de texto. Ele opera linha por linha e processa os dados de acordo com padrões especificados, permitindo o uso de expressões regulares, operações matemáticas, e construção de relatórios. O awk é muito eficiente para lidar com dados estruturados, como arquivos CSV, TSV e de colunas fixas, o que o torna uma excelente ferramenta para bioinformática, onde grandes volumes de dados precisam ser filtrados e analisados rapidamente.</p>

## Sintaxe Básica
A sintaxe do awk segue o formato:

awk 'padrão {ação}' arquivo

<p align="justify"> Aqui, o padrão é uma condição para selecionar linhas e a ação é a operação a ser realizada nessas linhas. Se a condição for verdadeira, o comando executa a ação sobre essas linhas. Caso nenhum padrão seja definido, a ação será executada para todas as linhas do arquivo.</p>

As variáveis predefinidas mais comuns no awk são:

    - $0: Representa a linha inteira.
    - $1, $2, ..., $n: Representam o primeiro, segundo, ..., enésimo campo de uma linha (campos delimitados por espaços ou caracteres definidos).
    - NR: Número da linha atual.
    - NF: Número de campos na linha atual.

### Vamos de exemplos Genéricos de Uso do awk

1. Extração de Colunas Específicas (O arquivo.txt pode ser baixado aqui no repositório)
Se quisermos imprimir apenas as colunas 1 e 3 de um arquivo com dados separados por espaços ou tabulações:

```
awk '{print $1, $3}' arquivo.txt
```

2. Condicionais com awk 

Se quisermos imprimir apenas as linhas onde o valor da segunda coluna é maior que 100:

```
awk '$2 > 100 {print $0}' arquivo.txt
```

3. Contagem de Linhas e Palavras

O awk pode ser usado para contar o número de linhas e o número total de campos (palavras) em um arquivo:
``
awk 'END {print "Número de linhas:", NR; print "Número de campos:", NF}' arquivo.txt
```

4. Somar Valores de uma Coluna

Para somar todos os valores da terceira coluna de um arquivo:

```
awk '{sum += $3} END {print "Soma total:", sum}' arquivo.txt
```


