#Este script mapeia leituras de RNA-Seq (FASTQ) usando Bowtie2 e gera um arquivo SAM como saída.
#!/bin/bash
# Script de mapeamento com Bowtie2

# Variáveis de entrada
INDEX="genoma_index" # Índice do genoma gerado previamente pelo Bowtie2
READ1="leituras_pareadas_1.fastq" # Arquivo FASTQ com as leituras forward
READ2="leituras_pareadas_2.fastq" # Arquivo FASTQ com as leituras reverse
OUT="resultado_map.sam" # Arquivo de saída em formato SAM

# Executando o mapeamento
bowtie2 -x $INDEX -1 $READ1 -2 $READ2 -S $OUT

# Explicação dos parâmetros
# -x: o índice do genoma para mapeamento
# -1 e -2: arquivos FASTQ com leituras pareadas (forward e reverse)
# -S: especifica o arquivo de saída no formato SAM

