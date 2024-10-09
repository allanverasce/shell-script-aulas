#!/bin/bash
#Neste script você pode fazer uma análise de vários arquivos fastas, acompanhando como uma barra de tarefas
#Sendo assim, ao final ele exibe um report da análise, neste caso estou contando a quantidade de contigs em vários fastas, dentro de um diretório

# Diretório com arquivos fasta . Não esquece de colocar apenas o Diretório aqui...
fasta_dir="/caminho/para/o/diretorio"  

# Aqui fazemos uma contagem de arquivos fasta, para usar como base no cálculo da barra de progresso
fasta_files=("$fasta_dir"/*.fasta)
total_files=${#fasta_files[@]}

# Se não houver arquivos, exiba uma mensagem e saia
if [ "$total_files" -eq 0 ]; then
    echo "Nenhum arquivo .fasta encontrado no diretório."
    exit 1
fi

# Inicializando contador de progresso
processed=0
report=()

# Função para exibir a barra de progresso
show_progress() {
    progress=$((processed * 100 / total_files))
    bar_width=$((progress / 2))  # A barra tem no máximo 50 caracteres
    bar=$(printf "%0.s#" $(seq 1 $bar_width))
    spaces=$((50 - bar_width))   # Calcula os espaços em branco para completar a barra
    empty=$(printf "%0.s " $(seq 1 $spaces))
    
    # Exibe a barra de progresso
    echo -ne "Processando: [$bar$empty] $progress% - $processed/$total_files arquivos\r"
}

# Iterando pelos arquivos fasta no diretório
for fasta_file in "${fasta_files[@]}"; do
    # Contagem de contigs em cada arquivo (número de linhas que começam com ">")
    contig_count=$(grep -c "^>" "$fasta_file")
    
    # Salvando o nome do arquivo e a contagem de contigs para exibir no final
    report+=("Arquivo: $(basename "$fasta_file") - Contigs: $contig_count")
    
    # Atualizando a barra de progresso
    processed=$((processed + 1))
    show_progress
    sleep 1  # Simulação de tempo de processamento, pode remover essa linha no uso real
done

# Exibindo uma nova linha após o término do processamento
echo -e "\nProcessamento concluído!\n"

# Exibindo o relatório final com a contagem de contigs para cada arquivo
for entry in "${report[@]}"; do
    echo "$entry"
done

