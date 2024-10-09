# Em Shell Script, strings podem ser manipuladas de várias maneiras. Abaixo estão algumas operações comuns:

- **Atribuição de String**:
    ```bash
    string="Olá, mundo!"
    ```

- **Imprimir String**:
    ```bash
    echo "$string"
    ```
Nota: Vimos aplicações desta forma na criação de variáveis e uso delas para imprimir na tela ...


## 1. Substring

Para extrair uma substring de uma string, você pode usar a sintaxe `${string:start:length}`.

### Exemplo:
```bash
string="Biologia Molecular"
substring=${string:0:7}  # Extrai "Biolog"
echo "$substring"
```

## 2. Split (Dividir)
Para dividir uma string em partes, você pode usar o comando IFS (Internal Field Separator).

Exemplo:

```
#!/bin/bash
string="gene1,gene2,gene3"
IFS=',' read -r gene1 gene2 gene3 <<< "$string"
echo "Primeiro gene: $gene1"
echo "Segundo gene: $gene2"
echo "Terceiro gene: $gene3"
```

## 3. Remoção de Strings
Você pode remover substrings específicas usando a sintaxe ${string//substring/}.

Exemplo:
```
string="Estudo de Genética"
nova_string=${string//Genética/Biologia}
echo "$nova_string"  # Exibe "Estudo de Biologia"
```
## 4.Substituindo uma Parte da String
Para substituir um trecho de uma string por outro, usamos a sintaxe ${string/antigo/novo}
```
#!/bin/bash

# Definindo uma string
str="ATGCGTAGCTAG"

# Substituindo 'G' por 'A'
modified_str=${str/G/A}

echo "String modificada: $modified_str"
```

Para substituir todas as ocorrências, você deve usar a sintaxe ${str//old/new} (com dois /).
```
#!/bin/bash

# Definindo uma string
str="ATGCGTAGCTAG"

# Substituindo todas as ocorrências de 'G' por 'A'
modified_str=${str//G/A}

# Exibindo o resultado
echo "String modificada: $modified_str"
```

### 5.Extraindo Subsequências de DNA
Este script extrai uma subsequência específica de uma sequência de DNA.
```
#!/bin/bash

# Sequência de DNA
dna_sequence="ATGCGTACGTTAGCTAGCGTAGCTA"

# Extraindo uma subsequência (da posição 4 à 10), sendo o 3 a coordenada inicial, e 7 o comprimento 
subseq=${dna_sequence:3:7}

echo "Subsequência extraída: $subseq"
```
### 6.Substituindo Sequências em um Arquivo GFF
Aqui substituímos um valor de atributo em um arquivo GFF, onde queremos modificar a informação sobre o gene.

```
#!/bin/bash

# Arquivo GFF (exemplo)
gff_file="genes.gff"

# Substituindo o nome de um gene "GeneX" por "GeneY". Lembre de analisar o GFF primeiro.
sed 's/GeneX/GeneY/g' "$gff_file" > "modified_genes.gff"

echo "Substituição de genes realizada no arquivo $gff_file"
```
Exemplo de Input
- chr1  .  gene  1000  5000  .  +  .  ID=GeneX;Name=GeneX
- chr1  .  gene  6000  9000  .  +  .  ID=GeneZ;Name=GeneZ

Output
- chr1  .  gene  1000  5000  .  +  .  ID=GeneY;Name=GeneY
- chr1  .  gene  6000  9000  .  +  .  ID=GeneZ;Name=GeneZ

### 7. Exemplo de script que verifica se uma sequência dada é uma sequência válida de DNA (contém apenas "A", "T", "C", "G").

```
#!/bin/bash

sequencia=$1

# Verificar se a sequência contém apenas os caracteres A, T, C, G
if [[ $sequencia =~ ^[ATCG]+$ ]]; then
    echo "Sequência válida de DNA"
else
    echo "Sequência inválida de DNA"
fi
```
### Vamos explicar! Fica ligado pq temos expressão regular aqui..
- Linha 5: if [[ $sequencia =~ ^[ATCG]+$ ]]; then
### Significado:
- Esta linha inicia um bloco condicional (if-else), onde será feita a verificação se a sequência de DNA fornecida contém apenas os caracteres A, T, C, ou G.
### [[ $sequencia =~ ^[ATCG]+$ ]]:
- $sequencia: Refere-se ao conteúdo da variável sequencia, ou seja, a sequência de DNA fornecida.
- =~: Esse operador faz a correspondência da string com um padrão (regex - expressão regular).
- ^[ATCG]+$: Essa é a expressão regular (regex) usada para fazer a correspondência com a sequência. Vamos quebrá-la:
- ^: Indica o início da string.
- [ATCG]: Define um conjunto de caracteres válidos (A, T, C, G).
- +: Indica que a string deve ter pelo menos um desses caracteres e pode ter mais.
- $: Indica o final da string.
- Portanto, o padrão verifica se a sequência contém apenas caracteres A, T, C, ou G do início ao fim.
- then: Se a condição for verdadeira (ou seja, a sequência contém apenas A, T, C, G), o script executa o bloco de código associado.
