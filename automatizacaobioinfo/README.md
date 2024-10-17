# Automação e Integração com Ferramentas Bioinformáticas (Ainda em construção)
<p align="justify">Neste módulo, abordaremos como utilizar Shell Script para automatizar e integrar ferramentas bioinformáticas em pipelines de análise. A automação dessas tarefas é essencial para o processamento eficiente de grandes volumes de dados, especialmente em biologia computacional.</p>

## 1. Execução de Programas Externos
<p align="justify">Ferramentas bioinformáticas como BLAST, BWA, SAMtools e Trimmomatic são frequentemente usadas em análises genômicas e proteômicas. Executar essas ferramentas manualmente pode ser demorado e sujeito a erros. Utilizando scripts em Shell, podemos automatizar essas execuções e integrar as ferramentas em um fluxo contínuo de trabalho.</p>

### Principais Tarefas:
- Integração com programas bioinformáticos: O Shell Script pode ser usado para chamar diretamente esses programas, fornecendo parâmetros e capturando saídas.
- Chamada de programas de terceiros: O script Shell permite executar programas externos e gerenciar as saídas (stdout) e erros (stderr).
- Gerenciamento de pipelines: Em bioinformática, pipelines são sequências de etapas que processam dados de forma ordenada, como alinhamento de sequências, trimagem de leituras, e conversão de formatos. Usando Shell Script, é possível criar pipelines para automatizar essas tarefas.
- Sintaxe Básica de Execução de Programas Externos em Shell
A sintaxe básica para chamar um programa dentro de um Shell Script é simples. Aqui está a estrutura genérica:
```
#!/bin/bash
comando_externo --opcoes entrada > saida
```
- comando_externo: O nome do programa ou comando a ser executado.
- --opcoes: Parâmetros opcionais ou obrigatórios necessários pelo programa.
- entrada: Arquivo ou dado que será processado.
- `>` saida: Redirecionamento da saída do programa para um arquivo ou outro comando.

### Exemplo 1: Integração com o BLAST
<p align="justify">O BLAST (Basic Local Alignment Search Tool) é uma das ferramentas mais utilizadas para comparar sequências de nucleotídeos ou proteínas. Aqui temos um exemplo simples do blast, caso queira adicionar mais parâmetros só fazer essa alteração diretamente na linha de comando do blast. `Não esquece de instalar o BLAST - sudo apt install ncbi-blast+`</p>

```
#!/bin/bash

# Definindo variáveis de entrada e saída
query="sequencia_query.fasta"
database="banco_dados_genoma.fasta"
blast_db="blastdb"
output="resultado_blast.txt"

# Etapa 1: Preparação do banco de dados local para o BLAST
echo "Preparando o banco de dados BLAST..."

makeblastdb -in $database -dbtype nucl -out $blast_db

# Verificando se o banco de dados foi criado com sucesso
if [ $? -eq 0 ]; then
  echo "Banco de dados BLAST preparado com sucesso!"
else
  echo "Erro na criação do banco de dados BLAST"
  exit 1
fi

# Etapa 2: Executando o BLAST
echo "Executando o BLAST..."

blastn -query $query -db $blast_db -out $output

# Verificando se o BLAST foi executado com sucesso
if [ $? -eq 0 ]; then
  echo "BLAST concluído com sucesso! Resultado salvo em $output"
else
  echo "Erro na execução do BLAST"
  exit 1
fi
```
### Vamos para explicação:
Definindo Variáveis:
- query: O arquivo de entrada que contém a sequência que será comparada.
- database: O arquivo FASTA que contém as sequências que serão utilizadas para criar o banco de dados local.
- blast_db: Nome do banco de dados BLAST que será criado.
- output: Arquivo onde o resultado do BLAST será salvo.

Etapa 1: Preparação do Banco de Dados:
O comando makeblastdb é usado para preparar o banco de dados que será utilizado pelo BLAST.
- -in: Especifica o arquivo de entrada que contém as sequências que formarão o banco de dados (neste caso, um arquivo FASTA).
- -dbtype: Define o tipo de banco de dados, que pode ser nucl (nucleotídeos) ou prot (proteínas). Neste exemplo, estamos usando um banco de dados de nucleotídeos.
- -out: Especifica o nome do banco de dados que será criado.
O script verifica se o banco de dados foi criado com sucesso usando o código de saída $?. Se a criação falhar, o script exibe uma mensagem de erro e interrompe a execução com exit 1.

Etapa 2: Execução do BLAST:
O comando blastn é utilizado para executar o BLAST.
- -query: Especifica o arquivo contendo a sequência de entrada que será comparada ao banco de dados.
- -db: Define o banco de dados que foi preparado anteriormente com makeblastdb.
- -out: Define o arquivo de saída que conterá o resultado do BLAST.
O script verifica se o BLAST foi executado com sucesso. Se for, uma mensagem de sucesso é exibida; caso contrário, ele exibe uma mensagem de erro e interrompe o script.

### Exemplo 2: Integração com BWA e SAMtools
<p align="justify">Nesta seção, vamos automatizar um pipeline para alinhamento de leituras FASTQ com o BWA e manipulação dos resultados com o SAMtools. Este exemplo é uma das etapas realizada em várias análises de dados dentre elas o RNA-Seq. Aqui coloquei alguns parâmetros, caso suas leituras (FASTQ) sejam de outro sequenciador e não illumina, você deve ajustar os parâmetros de acordo com a sua plataforma, por exemplo, removendo ILLUMINACLIP:adapters </p>

```
#!/bin/bash

# Etapa 1: Trimagem de Leituras com Trimmomatic
input_r1="amostra_R1.fastq"
input_r2="amostra_R2.fastq"
output_r1_paired="amostra_R1_paired.fastq"
output_r2_paired="amostra_R2_paired.fastq"
output_r1_unpaired="amostra_R1_unpaired.fastq"
output_r2_unpaired="amostra_R2_unpaired.fastq"

trimmomatic PE $input_r1 $input_r2 $output_r1_paired $output_r1_unpaired $output_r2_paired $output_r2_unpaired ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
echo "Trimagem de leituras concluída!"

# Etapa 2: Alinhamento com BWA
genoma_ref="genoma_referencia.fasta"
output_sam="alinhamento.sam"
bwa mem $genoma_ref $output_r1_paired $output_r2_paired > $output_sam
echo "Alinhamento concluído!"

# Etapa 3: Conversão de SAM para BAM e Ordenação
output_bam="alinhamento.bam"
output_bam_sorted="alinhamento_ordenado.bam"
samtools view -S -b $output_sam > $output_bam
samtools sort $output_bam -o $output_bam_sorted
echo "Conversão e ordenação concluídas!"
```

### Vamos explicar o passo-a-passo:
1. Trimagem de Leituras com Trimmomatic:
- trimmomatic PE: Este comando é usado para trimagem de leituras paired-end (R1 e R2).
- ILLUMINACLIP: Remove adaptadores de sequências.
- LEADING e TRAILING: Cortam bases de baixa qualidade no início e no fim das leituras.
- SLIDINGWINDOW: Remove trechos com qualidade abaixo de um limite em uma janela deslizante.
- MINLEN: Filtra leituras com comprimento abaixo de 36 bases.
Ao final desta etapa, temos arquivos FASTQ pareados (_paired.fastq) e não pareados (_unpaired.fastq).

2. Alinhamento com BWA:
- bwa mem: Realiza o alinhamento de sequências pareadas contra o genoma de referência.
- O resultado é salvo no formato SAM (alinhamento.sam).

3.Conversão e Ordenação com SAMtools:
- samtools view -S -b: Converte o arquivo SAM em BAM.
- samtools sort: Ordena o arquivo BAM para facilitar as próximas análises, como chamadas de variantes.

Este pipeline é altamente reutilizável em experimentos de RNA-Seq, por exemplo, e outras análises baseadas em sequenciamento de DNA ou RNA.

## Prokka
O Prokka é uma ferramenta de anotação de genomas bacterianos e arqueanos. Este script automatiza o processo de anotação para múltiplos arquivos FASTA em um diretório.
```
#!/bin/bash
# Script para anotar múltiplos arquivos FASTA usando Prokka

# Diretório contendo os arquivos FASTA
FASTA_DIR="caminho_para_arquivos_fasta"
OUTPUT_DIR="prokka_results"

# Criar diretório de saída
mkdir -p $OUTPUT_DIR

# Loop sobre todos os arquivos FASTA no diretório
for fasta in $FASTA_DIR/*.fasta; do
    filename=$(basename $fasta .fasta)
    prokka --outdir $OUTPUT_DIR/$filename --prefix $filename $fasta
done
```
Este script processa cada arquivo .fasta no diretório especificado e cria uma pasta de resultados de anotação separada para cada genoma.

## BUSCO
O BUSCO (Benchmarking Universal Single-Copy Orthologs) é uma ferramenta utilizada para avaliar a completude de conjuntos de genes essenciais conservados em genomas ou transcritos. Este script automatiza o processo de avaliação para múltiplos arquivos FASTA.
```
#!/bin/bash
# Script para executar BUSCO em múltiplos arquivos FASTA

# Diretório com os arquivos FASTA
FASTA_DIR="caminho_para_arquivos_fasta"
LINEAGE_SETS="bacteria_odb10"  # Exemplo para bactérias, ajuste conforme necessário
OUTPUT_DIR="busco_results"

# Criar diretório de saída
mkdir -p $OUTPUT_DIR

# Loop sobre todos os arquivos FASTA
for fasta in $FASTA_DIR/*.fasta; do
    filename=$(basename $fasta .fasta)
    busco -i $fasta -l $LINEAGE_SETS -o $OUTPUT_DIR/$filename -m genome
done
```
Esse script executa BUSCO em todos os arquivos .fasta dentro de um diretório, e salva os resultados em diretórios separados.

## Salmon
O Salmon é utilizado para quantificar a expressão de transcritos a partir de dados de RNA-seq. O script abaixo realiza quantificação de múltiplos arquivos FASTQ compactados (gzip).
```
#!/bin/bash
# Script para quantificação de múltiplos arquivos FASTQ usando Salmon

# Diretório com os arquivos FASTQ
FASTQ_DIR="caminho_para_arquivos_fastq"
SALMON_INDEX="salmon_index"
OUTPUT_DIR="salmon_quant_results"

# Criar diretório de saída
mkdir -p $OUTPUT_DIR

# Loop para quantificar cada arquivo FASTQ
for fastq in $FASTQ_DIR/*.fastq.gz; do
    filename=$(basename $fastq .fastq.gz)
    salmon quant -i $SALMON_INDEX -l A -r $fastq -p 8 -o $OUTPUT_DIR/$filename
done
```
Esse script processa cada arquivo FASTQ compactado no diretório e gera uma pasta de resultados para cada arquivo.

## Bowtie2
O Bowtie2 é um alinhador rápido e eficiente para dados de DNA e RNA. Este script automatiza o processo de alinhamento para múltiplos arquivos FASTQ.

```
#!/bin/bash
# Script para alinhar múltiplos arquivos FASTQ usando Bowtie2

# Diretório com os arquivos FASTQ
FASTQ_DIR="caminho_para_arquivos_fastq"
BOWTIE2_INDEX="bowtie2_index"
OUTPUT_DIR="bowtie2_results"

# Criar diretório de saída
mkdir -p $OUTPUT_DIR

# Loop para alinhar cada arquivo FASTQ
for fastq in $FASTQ_DIR/*.fastq.gz; do
    filename=$(basename $fastq .fastq.gz)
    bowtie2 -x $BOWTIE2_INDEX -U $fastq -S $OUTPUT_DIR/$filename.sam
done
```
## SPAdes
SPAdes é um montador de genomas que pode ser utilizado para montar genomas a partir de leituras curtas. O script a seguir monta múltiplos arquivos FASTQ de leitura emparelhada.
```
#!/bin/bash
# Script para executar SPAdes em múltiplos arquivos FASTQ paired-end

# Diretório com os arquivos FASTQ
FASTQ_DIR="caminho_para_arquivos_fastq"
OUTPUT_DIR="spades_results"

# Criar diretório de saída
mkdir -p $OUTPUT_DIR

# Loop sobre os arquivos FASTQ emparelhados
for sample in $(ls $FASTQ_DIR/*_R1.fastq.gz | sed 's/_R1.fastq.gz//'); do
    sample_name=$(basename $sample)
    spades.py -1 ${sample}_R1.fastq.gz -2 ${sample}_R2.fastq.gz -o $OUTPUT_DIR/$sample_name
done
```
## Flye
Flye é um montador de genomas projetado para lidar com long reads. Este script executa o Flye em múltiplos arquivos FASTQ, gerando montagens para cada arquivo encontrado em um diretório.
```
#!/bin/bash
# Script para montar múltiplos arquivos FASTQ usando Flye

# Diretório com os arquivos FASTQ long reads (PacBio ou Nanopore)
FASTQ_DIR="caminho_para_arquivos_fastq"
OUTPUT_DIR="flye_results"

# Criar diretório de saída
mkdir -p $OUTPUT_DIR

# Loop sobre cada arquivo FASTQ no diretório
for fastq in $FASTQ_DIR/*.fastq.gz; do
    sample_name=$(basename $fastq .fastq.gz)
    
    # Criar um subdiretório para cada amostra
    sample_output="$OUTPUT_DIR/$sample_name"
    mkdir -p $sample_output
    
    # Executar Flye para montar a amostra
    flye --nano-raw $fastq --out-dir $sample_output --genome-size 5m --threads 8
done
```
