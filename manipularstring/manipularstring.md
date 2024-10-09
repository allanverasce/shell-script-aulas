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

## 5.Extraindo Subsequências de DNA
Este script extrai uma subsequência específica de uma sequência de DNA.
```
#!/bin/bash

# Sequência de DNA
dna_sequence="ATGCGTACGTTAGCTAGCGTAGCTA"

# Extraindo uma subsequência (da posição 4 à 10), sendo o 3 a coordenada inicial, e 7 o comprimento 
subseq=${dna_sequence:3:7}

echo "Subsequência extraída: $subseq"
```
## 6.Substituindo Sequências em um Arquivo GFF
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

## 7. Exemplo de script que verifica se uma sequência dada é uma sequência válida de DNA (contém apenas "A", "T", "C", "G").

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
- Na Linha:
  ```
  if [[ $sequencia =~ ^[ATCG]+$ ]]; then
  ```
### Significado:
- Esta linha inicia um bloco condicional (if-else), onde será feita a verificação se a sequência de DNA fornecida contém apenas os caracteres A, T, C, ou G.
- $sequencia: Refere-se ao conteúdo da variável sequencia, ou seja, a sequência de DNA fornecida.
- =~: Esse operador faz a correspondência da string com um padrão (regex - expressão regular).
- ^[ATCG]+$: Essa é a expressão regular (regex) usada para fazer a correspondência com a sequência. Vamos quebrá-la:
- ^: Indica o início da string.
- [ATCG]: Define um conjunto de caracteres válidos (A, T, C, G).
- +: Indica que a string deve ter pelo menos um desses caracteres e pode ter mais.
- $: Indica o final da string.
- Portanto, o padrão verifica se a sequência contém apenas caracteres A, T, C, ou G do início ao fim.
- then: Se a condição for verdadeira (ou seja, a sequência contém apenas A, T, C, G), o script executa o bloco de código associado.

## 8. Como Recuperar o Comprimento de uma String em Shell Script
No Shell Script, você pode recuperar o comprimento de uma string usando a sintaxe ${#variavel}. Essa sintaxe retorna o número de caracteres presentes na string.

```
${#variavel}
```
Vejo exemplo no script

```
#!/bin/bash

# Definindo uma string
minha_string="AGCTTAGC"

# Recuperando o comprimento da string
comprimento=${#minha_string}

# Exibindo o resultado
echo "O comprimento da string é: $comprimento"
```

Vamos aplicar dentro do if-else
```
#!/bin/bash

# Definindo uma sequência de DNA
sequencia_dna="AGCTTAGCTAA"

# Verificando se o comprimento da sequência é maior que 10
if [[ ${#sequencia_dna} -gt 10 ]]; then
    echo "A sequência de DNA é longa o suficiente."
else
    echo "A sequência de DNA é muito curta."
fi
```

### Agora um exemplo, verificando similaridade entre Strings
Neste exemplo o script recebe duas sequências de DNA e realize um alinhamento simples, calculando a similaridade entre elas (quantidade de bases iguais na mesma posição).
- Objetivo: Manipulação avançada de strings e laços.
- Como executar: bash alinha_dna.sh "ATGCGT" "ATGCAT"
```
#!/bin/bash

seq1=$1
seq2=$2
similarity=0

# Verificando o tamanho das sequências
if [[ ${#seq1} -ne ${#seq2} ]]; then
    echo "As sequências devem ter o mesmo comprimento."
    exit 1
fi

# Alinhamento simples
for ((i=0; i<${#seq1}; i++)); do
    if [[ ${seq1:i:1} == ${seq2:i:1} ]]; then
        similarity=$((similarity+1))
    fi
done

echo "Similaridade: $similarity / ${#seq1}"

```
### Ficou confuso? vamos explicar!
- Inicializa a variável similarity com o valor 0. Esta variável será usada para contar quantas bases nas duas sequências são iguais.
- Verifica se as duas sequências têm o mesmo comprimento.
- ${#seq1}: Obtém o comprimento da string armazenada em seq1.
- ${#seq2}: Obtém o comprimento da string armazenada em seq2.
- -ne: Significa "não é igual". Portanto, se o comprimento de seq1 for diferente do comprimento de seq2, o script entra na condição do if.

Agora o bloco for 
- O loop for percorre cada posição das sequências, da primeira base até a última. Ele usa a variável i como índice para acessar os caracteres correspondentes em seq1 e seq2.
- i=0; i<${#seq1}; i++: Inicia o loop com i=0 e repete até i ser menor que o comprimento de seq1 (que é igual ao comprimento de seq2).
- Colocamos o incremento agora i++ (isso é a mesma coisa de fazer i=i+1), vamos analisar base a base e não uma lista
- Dentro do for, ele compara a base de seq1 com a mesma posição em seq2:
- ${seq1:i:1}: Extrai um caractere (base) de seq1 na posição i.
- ${seq2:i:1}: Extrai o caractere correspondente de seq2 na posição i.
- ==: Compara os dois caracteres. Se forem iguais, entra no bloco if.
- Se as bases forem iguais, incrementa a variável similarity:
- similarity=$((similarity+1)): Isso aumenta o contador de similaridade em 1.

