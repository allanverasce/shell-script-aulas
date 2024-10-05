## Aula 05 - Estruturas Condicionais (if-else)
<p align="justify">As estruturas condicionais if-else permitem que um bloco de código seja executado dependendo do resultado de uma condição. Esse tipo de controle é essencial em programação, pois possibilita tomar decisões com base nos dados ou em determinadas circunstâncias. Em linguagens de script como o Bash, a sintaxe para o if-else é simples e flexível.</p>

Sintaxe Básica:

```
if [ condição ]; then
    # Comandos a serem executados se a condição for verdadeira
elif [ outra_condição ]; then
    # Comandos se a outra condição for verdadeira
else
    # Comandos a serem executados se todas as condições forem falsas
fi
```
### Vamos falar sobre os principais Tipos de Testes Lógicos:
1. Igualdade:

- ==: Verifica se dois valores são iguais.
- !=: Verifica se dois valores são diferentes.
  
Exemplo:

```
if [ "$var" == "valor" ]; then
    echo "As variáveis são iguais."
fi
```
2. Comparação Numérica:

- -eq: Verifica se dois números são iguais.
- -ne: Verifica se dois números são diferentes.
- -lt: Verifica se o primeiro número é menor que o segundo.
- -gt: Verifica se o primeiro número é maior que o segundo.

Exemplo:

```
if [ "$num" -gt 10 ]; then
    echo "O número é maior que 10."
fi
```
3. Testes em Arquivos:

- -e: Verifica se o arquivo existe.
- -f: Verifica se o arquivo existe e é regular.
- -d: Verifica se o caminho é um diretório.
Exemplo:

```
if [ -e "arquivo.txt" ]; then
    echo "O arquivo existe."
fi
```
4. Combinação de Testes:

- -a: Operador lógico E (AND).
- -o: Operador lógico OU (OR).
Exemplo:
```
if [ "$var1" -gt 5 -a "$var2" -lt 10 ]; then
    echo "Ambas as condições são verdadeiras."
fi
```
Exemplo Genérico
<p align="justify">Imagine que você está desenvolvendo um script para classificar a idade de indivíduos. Se a idade for menor que 18, o indivíduo é classificado como menor de idade; se for maior ou igual a 18, é classificado como adulto.</p>

```
#!/bin/bash

idade=20

if [ "$idade" -lt 18 ]; then
    echo "Menor de idade."
else
    echo "Adulto."
fi
```

<p align="justify">Estas estruturas podem ser utilizadas em biologia, isso pode ser útil para verificar, por exemplo, se um dado genômico contém uma sequência específica ou para categorizar dados conforme condições biológicas.</p>

### Exemplo aplicado à biologia:
<p align="justify">Imaginemos que você está processando dados de sequências genômicas, e precisa verificar se uma sequência contém uma determinada mutação, como a presença de uma substituição de base.</p>

```
#!/bin/bash

sequencia="ATGCATGGAC"

if [[ "$sequencia" == *"A"* ]]; then
    echo "A mutação está presente!"
else
    echo "A mutação não foi encontrada."
fi
```

Vamos ver mais um exemplo. Verificação de Tamanho de Arquivos FASTA
Este script verifica se o arquivo FASTA tem mais de 1000 linhas (o que pode indicar um grande número de sequências, obs: apenas um exemplo kkk) e alerta o usuário.

```
#!/bin/bash

# Arquivo FASTA a ser analisado
fasta_file="sequencias.fasta"

# Verificar o número de linhas no arquivo FASTA
line_count=$(wc -l < "$fasta_file")

# Condição if-else
if [ "$line_count" -gt 1000 ]; then
    echo "O arquivo $fasta_file contém muitas sequências: $line_count linhas."
else
    echo "O arquivo $fasta_file contém poucas sequências: $line_count linhas."
fi
```

Verificação de Formato de Arquivo Genômico. Este script verifica se o arquivo fornecido está no formato FASTA, GFF ou BAM, com base na extensão do arquivo, e realiza a operação adequada.

```
#!/bin/bash

# Arquivo de entrada
input_file="dados_genomicos.bam"

# Condição if-else para verificar o tipo de arquivo
if [[ "$input_file" == *.fasta ]]; then
    echo "Processando arquivo FASTA..."
    # Comando para processar o arquivo FASTA
elif [[ "$input_file" == *.gff ]]; then
    echo "Processando arquivo GFF..."
    # Comando para processar o arquivo GFF
elif [[ "$input_file" == *.bam ]]; then
    echo "Processando arquivo BAM..."
    # Comando para processar o arquivo BAM
else
    echo "Formato de arquivo desconhecido."
fi
```
