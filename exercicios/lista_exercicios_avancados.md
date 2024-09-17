# Avançados

- Exercício 1: Crie um script que capaz de aceitar parâmetros da linha de comando para processar dados. O script deve aceitar o nome do arquivo e o número mínimo de linhas como parâmetros. Como resultado deve ser informado ao usuário se o arquivo possui ou não o número mínimo de linhas.
- Exercício 2: Crie um script que utiliza arrays para armazenar uma lista de arquivos e processa cada arquivo de forma iterativa. Ao final, deve ser exibido os nomes de todos os arquivos em cada posição do array.
- Exercício 3: Automatizar a montagem de genomas com SPAdes para múltiplos arquivos. Crie um script que realize a montagem de genomas com SPAdes em todos os arquivos FASTQ de um diretório. O script deve:
  - Aceitar arquivos de leitura pareada (paired-end).
  - Criar subpastas para cada montagem.
  - Gerar um relatório resumindo o número de contigs e o tamanho do genoma montado para cada arquivo.
- Exercício 4: Chamar variantes (SNPs) em múltiplos arquivos BAM. Escreva um script que processe múltiplos arquivos BAM para identificar SNPs usando bcftools. O script deve:
  - Verificar a existência dos arquivos BAM.
  - Executar o mpileup para gerar um arquivo de variantes VCF para cada arquivo BAM.
  - Gerar um relatório com o número de SNPs identificados em cada arquivo.

