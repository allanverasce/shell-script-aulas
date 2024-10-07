## Vamos juntar tudo ??

### Exemplos com `sed`

1. **Renomeação de IDs em arquivos FASTA**

   Se você tem um arquivo FASTA e deseja renomear os IDs das sequências para que sejam mais descritivos, você pode usar `sed` para modificar os identificadores:

   ```bash
   sed 's/>old_id_/\>new_id_/' sequences.fasta > renamed_sequences.fasta
   ```
   Isso substitui todas as ocorrências de `>old_id_` por `>new_id_`.

2. **Extraindo linhas que contêm um padrão**

   Para extrair apenas as sequências de um arquivo FASTA que contêm uma sequência específica (por exemplo, um gene), você pode usar:

   ```bash
   sed -n '/>gene_1/,/^>/p' sequences.fasta | sed '$d' > gene_sequences.fasta
   ```
   Isso extrai todas as linhas a partir da linha que contém `>gene_1`.
   

4. **Remover linhas em um arquivo GFF que não contêm genes**

   Se você possui um arquivo GFF e deseja remover todas as linhas que não têm informações sobre genes, pode usar:

   ```bash
   sed '/gene/d' annotations.gff > filtered_annotations.gff
   ```
   Esse comando remove todas as linhas que contêm a palavra "gene".

### Exemplos com `awk`

1. **Análise de arquivos CSV de expressão gênica**

   Imagine que você tem um arquivo CSV que contém dados de expressão gênica, onde a primeira coluna é o nome do gene e as seguintes são os valores de expressão em diferentes condições. Você pode calcular a média de expressão de cada gene com:

   ```
   awk -F, 'NR > 1 { for(i=2; i<=NF; i++) sum[$1] += $i; count[$1] = 3 } END { for (gene in sum) print gene, sum[gene]/count[gene] }' /home/allan/Downloads/expression_data.csv
   ```
   Este comando calcula a média de expressão de cada gene e armazena o resultado em um novo arquivo.


3. **Filtrar genes com expressão acima de um determinado limiar**

   Para filtrar genes com expressão superior a um determinado valor (por exemplo, 5), você pode usar:

   ```bash
   awk '$2 > 5 { print $1 }' expression_data.csv > high_expression_genes.txt
   ```
   - $2 > 5: Verifica se o segundo campo é maior que 5.
   - { print $1 }: Se a condição for verdadeira, imprime o primeiro campo (que é o nome do gene).
   - > high_expression_genes.txt: Redireciona a saída para o arquivo high_expression_genes.txt.


4. **Extraindo informações de arquivos GFF**

   Se você quiser extrair apenas os IDs dos genes e suas coordenadas a partir de um arquivo GFF, pode usar o seguinte comando `awk`:

   ```bash
   awk '$3 == "gene" { print $9 }' annotations.gff | sed 's/.*ID=\([^;]*\).*/\1/' > gene_ids.txt
   ```
   Neste comando, `awk` seleciona apenas as linhas onde o terceiro campo (tipo) é "gene", e `sed` é usado para extrair o ID do gene da nona coluna.


### Exemplos Combinados de `sed` e `awk`

1. **Filtrando e formatando dados de expressão gênica**

   Se você deseja obter uma lista de genes e suas expressões apenas se a expressão for maior que um certo valor e formatar a saída, você pode combinar `awk` e `sed`:

   ```bash
   awk '$2 > 5 { print $1, $2 }' expression_data.csv | sed 's/ /: /' > formatted_high_expression_genes.txt
   ```
### Vamos para Explicação
- awk '$2 > 5 { print $1, $2 }' expression_data.csv: Esse comando verifica se o segundo campo é maior que 5 e imprime o primeiro e o segundo campo.
- | sed 's/ /: /': O comando sed está substituindo o primeiro espaço encontrado entre o primeiro e o segundo campo por : . Isso transforma a saída de gene_2 6.16667 para gene_2: 6.16667.
- > formatted_high_expression_genes.txt: Redireciona a saída para o arquivo formatted_high_expression_genes.txt.

2. **Extraindo e formatando anotações de genes em GFF**

   Para extrair anotações e formatá-las em um formato legível, você pode usar:

   ```bash
   awk '$3 == "gene" { print $1, $4, $5, $9 }' annotations.gff | sed 's/;.*//;s/ID=//g' > gene_annotations.txt
   ```
   Aqui, `awk` extrai as colunas relevantes (contendo o ID do gene e suas coordenadas), e `sed` formata a saída removendo partes indesejadas.

## Fica a dica, você pode avançar bem se ajustar os comandos de acordo com seu problema.
