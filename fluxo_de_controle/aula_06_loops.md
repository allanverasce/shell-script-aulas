### Aula 06 - Loops (for e while)
<p align="justify">Loops permitem repetir blocos de código até que uma condição seja atendida. Eles são frequentemente usados em programação para automatizar tarefas repetitivas, como processar listas de arquivos ou executar cálculos em um grande conjunto de dados.</p>

Sintaxe Básica do Loop for:

```
for var in lista_de_valores; do
    # Comandos a serem repetidos
done
```
Exemplo Genérico de Loop:
Um exemplo genérico de um loop for que imprime números de 1 a 10:

```
#!/bin/bash
for i in {1..10}; do
    echo "Número: $i"
done
```
Esse script utiliza um loop para imprimir os números de 1 a 10. O loop é muito útil em diversas situações, como processar listas ou arquivos.

### Exemplo Aplicado à Biologia com for:
<p align="justify">Imagine que você tenha um conjunto de arquivos FASTA contendo sequências de várias amostras, e deseja contar o número de sequências em cada arquivo. O for pode ser usado para percorrer todos os arquivos e contar as sequências em cada um deles.</p>
Veja uma solução.

```
#!/bin/bash

# Lista de arquivos FASTA
arquivos=("amostra1.fasta" "amostra2.fasta" "amostra3.fasta")

for arquivo in "${arquivos[@]}"; do
    echo "Processando $arquivo..."
    # Contar quantas linhas começam com '>', que indicam o início de uma nova sequência em arquivos FASTA
    num_sequencias=$(grep -c "^>" "$arquivo")
    echo "O arquivo $arquivo contém $num_sequencias sequências."
done
```
Vamos lá para explicação, fique atento!
- Temos três arquivos FASTA (amostra1.fasta, amostra2.fasta e amostra3.fasta).
- O script percorre cada um deles e usa o comando `grep` para contar as linhas que começam com `>`, que representam o cabeçalho de uma sequência no formato FASTA.

### Loop while
<p align="justify">O loop while continua repetindo um bloco de código enquanto uma condição for verdadeira. Ele é útil quando o número de iterações não é conhecido antecipadamente, sendo determinado pelo cumprimento de uma condição.</p>

Sintaxe Básica do while:

```
while [ condição ]; do
    # Comandos a serem executados enquanto a condição for verdadeira
done
```
<p align="justify">O loop while avalia a condição a cada iteração e repete o bloco de código enquanto essa condição for verdadeira. Assim que a condição não é mais satisfeita, o loop é interrompido.</p>

Exemplo Genérico com while:
Vamos supor que você queira imprimir números de 1 a 10, usando um while em vez de um for:

```
#!/bin/bash
i=1
while [ $i -le 10 ]; do
    echo "Número: $i"
    i=$((i + 1))
done
```
Vamos pra explicação, fique atento: 
- A variável i começa com o valor 1.
- O loop while continua executando enquanto i for menor ou igual a 10.
- Em cada iteração, o valor de i é incrementado em 1. (incrementar significa dizer que será adicionado um valor)

### Exemplo Aplicado à Biologia com while:
<p align="justify">Agora, vamos aplicar o while para processar um arquivo FASTA. Queremos percorrer as sequências no arquivo e calcular o comprimento de cada sequência (ignorando as linhas que começam com >).</p>

```
#!/bin/bash

# Exemplo de arquivo FASTA (sequencias.fasta), vc mesmo pode criar.
# >seq1
# ATGCGTA
# >seq2
# GCGTTACGT

while read -r linha; do
    # Ignorar linhas que começam com '>'
    if [[ "$linha" != ">"* ]]; then
        comprimento=${#linha}
        echo "Comprimento da sequência: $comprimento"
    fi
done < sequencias.fasta
```
Vamos a explicação
- O loop while lê o arquivo sequencias.fasta linha por linha.
- As linhas que começam com > (cabeçalhos de sequência) são ignoradas.
- O comprimento de cada sequência é calculado usando ${#linha}, que retorna o número de caracteres em uma string.
- Assim, para cada sequência, o script imprime o comprimento da mesma.

## Vamos fazer outro exemplo?
<p align="justify">Suponha que você tenha uma lista de IDs de genes em um arquivo e precise realizar uma busca em um banco de dados local para cada gene. Um loop while pode ser usado para ler cada ID e realizar a busca.</p>

```
#!/bin/bash

# Exemplo de arquivo com IDs de genes (genes.txt), Você pode criar para poder testar seu script. Pode fazer usando nano ou outro editor de texto, como gedit
# geneA
# geneB
# geneC

while read -r gene; do
    echo "Buscando informações para o gene: $gene"
    # Simulando uma busca no banco de dados
    resultado=$(grep "$gene" banco_de_dados_genes.txt)
    
    if [ -z "$resultado" ]; then
        echo "Gene $gene não encontrado no banco de dados."
    else
        echo "Resultado encontrado: $resultado"
    fi
done < genes.txt
```
Vamos pra explicação, fique atento:
- O loop while lê o arquivo genes.txt linha por linha, onde cada linha contém um ID de gene.
- Para cada gene, o script realiza uma busca no arquivo banco_de_dados_genes.txt usando o comando grep.
- Se o gene não for encontrado, o script informa que o gene não está no banco de dados; caso contrário, ele exibe o resultado encontrado.

### Vamos entender como funciona comparando eles?

- for: Ideal para quando você conhece a quantidade de iterações antecipadamente, como percorrer uma lista ou intervalo de números.
- while: Útil quando o número de iterações não é conhecido, e você precisa repetir uma ação enquanto uma condição específica for verdadeira.

#### Vamos treinar, segue uns exemplos pra você praticar no seu computador.

Neste exemplo, usamos o laço for para iterar sobre uma lista de números e calcular seus quadrados.
```
#!/bin/bash

# Laço para iterar sobre uma lista de números
for num in 1 2 3 4 5; do
    square=$((num * num))
    echo "O quadrado de $num é $square"
done
```
### Como funciona:
- O laço for percorre uma lista de números.
- Em cada iteração, calcula o quadrado de um número e imprime o resultado.

Aqui, usamos o laço while para contar de 1 a 5.
```
#!/bin/bash

# Definindo a variável de contagem
count=1

# Laço while para iterar enquanto count for menor ou igual a 5
while [ $count -le 5 ]; do
    echo "Contagem: $count"
    count=$((count + 1))
done
```

### Como funciona:
- O laço while continua a execução enquanto a condição [ $count -le 5 ] for verdadeira.
- A cada iteração, o valor da variável count é incrementado em 1.

## Laço for Aplicado à Biologia (Iterando sobre Arquivos FASTA)
Este script itera sobre todos os arquivos FASTA em um diretório e calcula o número de sequências em cada arquivo.
```
#!/bin/bash

# Diretório com arquivos FASTA
fasta_dir="/path/to/fasta_files"

# Laço para iterar sobre cada arquivo FASTA no diretório

for fasta_file in $fasta_dir/*.fasta; do
    # Conta o número de sequências no arquivo (linhas começando com ">")
    num_sequences=$(grep -c "^>" $fasta_file)
    echo "O arquivo $fasta_file contém $num_sequences sequências"
done
```
### Como funciona:
- O laço for percorre todos os arquivos .fasta no diretório especificado.
- Para cada arquivo, conta o número de sequências usando grep -c "^>", que conta as linhas que começam com o símbolo >, e exibe o resultado.

## Laço while Aplicado à Biologia (Processamento de Dados GFF)
Neste exemplo, usamos um laço while para iterar sobre as linhas de um arquivo GFF e extrair genes de interesse.

```
#!/bin/bash

# Arquivo GFF
gff_file="genome_annotations.gff"

# Laço while para ler cada linha do arquivo GFF
while IFS= read -r line; do
    # Verifica se a linha contém o gene de interesse (exemplo: Name=CDY19P)
    if echo "$line" | grep -q "Name=CDY19P"; then
        echo "Gene encontrado: $line"
    fi
done < "$gff_file"
```

