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

```
awk 'END {print "Número de linhas:", NR; print "Número de campos:", NF}' arquivo.txt
```

4. Somar Valores de uma Coluna

Para somar todos os valores da terceira coluna de um arquivo:

```
awk '{sum += $3} END {print "Soma total:", sum}' arquivo.txt
```

# Vamos aplicar a Biologia ?
<p align="justify"> O awk é frequentemente usado para manipular arquivos de dados biológicos como GFF, VCF, FASTA, e CSV. Abaixo estão alguns exemplos específicos de uso do awk aplicados a esses formatos de arquivo.</p>

1. Filtragem de Arquivos GFF

<p align="justify"> Um arquivo GFF (General Feature Format) contém informações sobre anotações genômicas, com colunas que incluem: seqname, source, feature, start, end, etc. Se quisermos filtrar as anotações apenas de genes, podemos fazer isso com:</p>

```
awk '$3 == "gene" {print $0}' arquivo.gff
```
Aqui, $3 corresponde à coluna de "features" e o comando filtra apenas as linhas que têm "gene" como feature.

2. Extração de IDs de Genes em VCF

Arquivos VCF (Variant Call Format) são usados para armazenar variações genômicas. Para extrair os IDs de variantes de um arquivo VCF:

```
awk '!/^#/ {print $3}' arquivo.vcf
```
Aqui, !/^#/ (Galera isso aqui é parte de uma expressão regular) ignora as linhas de cabeçalho (que começam com #) e imprime a terceira coluna, que contém os IDs das variantes.

3. Contagem de Sequências em Arquivos FASTA

Um arquivo FASTA contém sequências biológicas (DNA, RNA ou proteínas). As sequências são precedidas por uma linha de cabeçalho que começa com >. Podemos contar quantas sequências estão no arquivo usando: (Lembra que te mostrei um jeito bem simples usando o grep -c ">" arquivo.fasta.)

``
awk '/^>/ {count++} END {print "Número de sequências:", count}' arquivo.fasta
``

4. Somando o Tamanho de Exons de um Gene em Arquivo GFF

Se quisermos somar o tamanho total dos exons de um gene específico, podemos fazer em duas etapas:

- Precisamos verificar o formato correto do campo de atributos ($9), onde o ID do gene está localizado. Use o seguinte comando para examinar algumas dessas linhas e descobrir como os IDs dos genes estão sendo apresentados:

```
awk '$3 == "exon" {print $9}' /home/allan/Downloads/Homo_sapiens.GRCh38.112.gff3 | head
```
<p align="justify"> Agora que sabemos que os transcritos estão associados ao campo Parent=transcript:ENST00000456328, podemos ajustar o comando para fazer o cálculo dos exons de um transcrito específico. O novo comando awk vai buscar o identificador ENST00000456328 ou outro transcrito que você quiser calcular, dentro do campo Parent </p>

Exemplo: Para calcular o tamanho total dos exons associados ao transcrito ENST00000456328, podemos fazer o seguinte: (Eu baixei o gff, quando você for utilizar coloque o caminho onde baixou no seu computador.. (Fica ligado)

```
awk '$3 == "exon" && $9 ~ /Parent=transcript:ENST00000456328/ {sum += $5 - $4 + 1} END {print "Tamanho total dos exons:", sum}' /home/allan/Downloads/Homo_sapiens.GRCh38.112.gff3
```
### Vamos explicar!!
    - $3 == "exon": Filtra apenas as linhas que contêm "exon" na terceira coluna.
    - $9 ~ /Parent=transcript:ENST00000456328/: Verifica se o campo de atributos (coluna $9) contém o ID do transcrito que você quer.
    - sum += $5 - $4 + 1: Calcula o tamanho do exon, subtraindo a posição inicial ($4) da posição final ($5) e somando 1.
    - END {print "Tamanho total dos exons:", sum}: Exibe o tamanho total dos exons ao final do arquivo.
