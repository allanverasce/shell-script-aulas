# Vamos explorar o comando sed.

<p align="justify">O comando sed (Stream Editor) é uma poderosa ferramenta de manipulação de texto no Linux, usada para buscar, substituir, adicionar ou remover linhas e padrões em arquivos de forma não interativa. Ele permite que você processe fluxos de dados ou arquivos sem a necessidade de abrir esses arquivos diretamente. O sed é muito útil em automação de tarefas, especialmente quando combinando com scripts em Bash.</p>

### Estrutura básica do sed (Sintaxe)
A estrutura básica do comando sed é:
```
sed [opções] 'script' arquivo
```
Aqui, o script pode ser uma simples substituição, como s/padrão/substituição/, e o arquivo é o arquivo de texto onde a operação será aplicada.

### Aplicações e exemplos práticos
<p align="justify">Substituição simples de texto A operação mais comum do sed é a substituição. O formato básico é s/padrão/substituição/, onde s significa "substituir", seguido pelo padrão a ser encontrado e o texto de substituição.</p>

Conteúdo do arquivo frutas.txt
- maçã
- banana
- maçã verde
- uva
- laranja

Exemplo:
```
sed 's/maçã/laranja/' frutas.txt
```
Alterando múltiplos arquivos O sed também pode ser utilizado em múltiplos arquivos ao mesmo tempo:

```
sed -i 's/antigo/novo/g' *.txt
```
Excluir linhas que contêm um padrão O sed pode excluir linhas com base em padrões:

```
sed '/maçã/d' frutas.txt
```

Inserir texto após um padrão O sed pode adicionar linhas de texto após encontrar um padrão: (To sabendo que já ia perguntar, né??)

```
sed '/maçã/a\Esta é uma fruta' frutas.txt
```
Neste exemplo, ele insere "Texto adicional" após a linha que contém o "padrão".

Substituindo texto entre um intervalo de linhas. Você pode aplicar alterações apenas em um intervalo específico de linhas:

```
sed '2,4s/maçã/laranja/' frutas.txt
```
Aqui, as linhas 2 a 4 terão "maçã" substituído por "laranja".

# Vamos aplicar o sed na Biologia?
<p align="justify">O sed é frequentemente utilizado para manipular arquivos de dados como FASTA, GFF, CSV, ou arquivos de resultados de pipelines bioinformáticos. Esses arquivos podem ser muito grandes e conter milhões de linhas, tornando a automação essencial.</p>

  1. Renomeação de IDs de sequência em arquivos FASTA Muitas vezes, é necessário alterar os identificadores de sequências em arquivos FASTA para simplificar as análises ou para conformidade com requisitos de outros programas: </p>
Conteúdo do arquivo sequencias.fasta
<p>>gene_1234 sequencia_1</p>
<p>ATGCGTACGTA</p>
<p>>gene_5678 sequencia_2</p>
<p>CGTACGTAGCT</p>
<p>>gene_9101 sequencia_3</p>
<p>TACGATCGAT</p>

```
sed 's/>.*\(gene_[0-9]*\).*/>\1/' sequencias.fasta
```
Neste exemplo, todos os IDs das sequências são renomeados, mantendo apenas a parte que corresponde ao padrão gene_[0-9]*.

2. Extração de informações de arquivos GFF Arquivos GFF contêm informações de anotação de genomas, e o sed pode ser usado para extrair ou filtrar essa

```
sed -n '/gene/{n;p}' /home/allan/Downloads/Homo_sapiens.GRCh38.112.gff3
```


