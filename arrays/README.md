# Arrays em Shell Script

<p align="justify">Em toda linguagem de programação existem estruturas de dados que são utilizadas para armazenar valores. Em Shell Script, arrays são estruturas de dados que permitem armazenar múltiplos valores em uma única variável. Isso facilita a manipulação de grandes conjuntos de dados, como listas de arquivos, sequências biológicas ou qualquer outro tipo de coleção. É importante ressaltar que cada estrutura de dados tem uma dimensão que consegue suportar de dados, sendo assim, em caso de volumes consideráveis é necessário que escolha a estrutura mais adequada para o manuseio dos mesmos</p>

## Definição de Arrays

Para definir um array no Shell Script, utilizamos a seguinte sintaxe:

```bash
# Definição de um array com vários elementos
meu_array=("elemento1" "elemento2" "elemento3" "elemento4")
```
## Acessando Elementos de um Array
Os elementos de um array são indexados começando do valor 0. Podemos acessar um elemento específico do array utilizando a seguinte sintaxe:

```
# Acessando o primeiro elemento (índice 0)
echo ${meu_array[0]}

# Acessando o terceiro elemento (índice 2)
echo ${meu_array[2]}
```
## Como modificar um Elemento do Array?
Podemos alterar o valor de um elemento específico em um array da seguinte maneira:
```
# Modificando o segundo elemento
meu_array[1]="novo_elemento2"

# Verificando a alteração
echo ${meu_array[1]}
```
## Acessando Todos os Elementos do Array
Para acessar todos os elementos do array de uma só vez, utilizamos o símbolo @ ou *:
```
# Acessando todos os elementos
echo ${meu_array[@]}

# Outra forma de acessar todos os elementos
echo ${meu_array[*]}
```
## Tamanho do Array
Para obter o número de elementos presentes em um array, usamos a seguinte sintaxe:

```
# Número de elementos no array
echo ${#meu_array[@]}
```
## Iterando Sobre um Array
Para percorrer um array e executar uma ação para cada elemento, podemos utilizar um loop for:
```
# Iterando sobre cada elemento do array
for elemento in "${meu_array[@]}"; do
    echo "Elemento: $elemento"
done
```
## Remover Elementos de um Array
Para remover um elemento específico de um array, podemos usar o comando unset:
```
# Removendo o segundo elemento do array
unset meu_array[1]

# Imprimindo os elementos restantes
echo ${meu_array[@]}
```
## Remover Todos os Elementos de um Array
Para limpar completamente um array, podemos utilizar o comando unset sem especificar um índice:
```
# Removendo todos os elementos do array
unset meu_array

# Verificando se o array está vazio
echo ${meu_array[@]}
```
## Arrays Associativos (Bash 4 ou superior)
<p align="justify">Os arrays associativos são uma funcionalidade avançada do Bash (a partir da versão 4.0). Ao contrário dos arrays numéricos tradicionais, os arrays associativos permitem que as chaves sejam strings em vez de números. Isso é útil quando você deseja mapear valores a nomes em vez de a números, como por exemplo em um dicionário.</p>


```
# Definindo um array associativo
declare -A associativo

# Adicionando valores ao array associativo
associativo["chave1"]="valor1"
associativo["chave2"]="valor2"

# Acessando os valores
echo ${associativo["chave1"]}  # Imprime valor1
echo ${associativo["chave2"]}  # Imprime valor2
```
## Imprimindo Chave e Valor Juntos
É possível imprimir as chaves e os valores juntos. Para isso, você pode usar um loop for para iterar sobre as chaves e imprimir o par chave-valor:
```
# Iterando sobre o array associativo para imprimir chave e valor
for chave in "${!associativo[@]}"; do
    echo "Chave: $chave, Valor: ${associativo[$chave]}"
done
```
Esse loop vai percorrer todas as chaves do array associativo e imprimir cada chave com seu valor correspondente.

## Posso Obter a Chave a Partir de um Valor?
<p align="justify">No Bash, não existe uma função nativa que retorne diretamente a chave a partir de um valor, mas você pode contornar isso iterando sobre o array e comparando os valores manualmente. Aqui está um exemplo de como fazer isso:</p>

```
# Procurando a chave correspondente a um valor específico
valor_procurado="valor2"
for chave in "${!associativo[@]}"; do
    if [[ "${associativo[$chave]}" == "$valor_procurado" ]]; then
        echo "A chave correspondente ao valor $valor_procurado é: $chave"
    fi
done
```
Neste código, verificamos qual chave está associada ao valor "valor2".

## É possível ter Redundância de Chaves (Chaves Duplicadas)? 
<p align="justify">Não, arrays associativos não permitem chaves duplicadas. Cada chave deve ser única. Se você tentar definir um valor para uma chave que já existe, o novo valor irá sobrescrever o valor anterior:</p>

```
# Definindo uma chave duplicada
associativo["chave1"]="novo_valor"

# Verificando a substituição do valor
echo ${associativo["chave1"]}  # Saída: novo_valor
```
No exemplo acima, o valor "valor1" foi sobrescrito por "novo_valor".

## Exemplo Completo
Aqui está um exemplo completo que inclui a definição, atribuição de valores, impressão de chaves e valores, e verificação de valores no array:

```
#!/bin/bash

# Declarando um array associativo
declare -A associativo

# Adicionando valores ao array
associativo["geneA"]="ATGCGC"
associativo["geneB"]="GCTTGA"
associativo["geneC"]="CGATGC"

# Imprimindo todas as chaves e valores
echo "Chaves e valores no array associativo:"
for chave in "${!associativo[@]}"; do
    echo "Chave: $chave, Valor: ${associativo[$chave]}"
done

# Procurando a chave correspondente a um valor
valor_procurado="GCTTGA"
for chave in "${!associativo[@]}"; do
    if [[ "${associativo[$chave]}" == "$valor_procurado" ]]; then
        echo "A chave correspondente ao valor $valor_procurado é: $chave"
    fi
done
```
## Resumo das Principais Características
- Chaves únicas: Arrays associativos não permitem chaves duplicadas. O valor da chave será sobrescrito se tentar definir um novo valor para uma chave já existente.
- Impressão de chave-valor: Pode-se imprimir chaves e valores usando loops.
- Busca de chave a partir de valor: Não há suporte nativo, mas você pode realizar essa busca manualmente usando loops.
- Versão do Bash: Arrays associativos são suportados apenas a partir do Bash 4.0.

## Exemplo utilizando o código genético
Array Associativo: Criamos um array associativo chamado codon_to_amino_acid que mapeia trincas de nucleotídeos (códons) para aminoácidos. As chaves são os códons, e os valores são os aminoácidos correspondentes.
```
#!/bin/bash

# Definindo o array associativo com os códons como chaves e os aminoácidos como valores
declare -A codon_to_amino_acid=(
  ["AUG"]="Met"
  ["UUU"]="Phe" ["UUC"]="Phe"
  ["UUA"]="Leu" ["UUG"]="Leu"
  ["CUU"]="Leu" ["CUC"]="Leu" ["CUA"]="Leu" ["CUG"]="Leu"
  ["AUU"]="Ile" ["AUC"]="Ile" ["AUA"]="Ile"
  ["GUU"]="Val" ["GUC"]="Val" ["GUA"]="Val" ["GUG"]="Val"
  # Outros códons e aminoácidos podem ser adicionados aqui
)

# Sequência de nucleotídeos a ser traduzida (substituindo o T por U para representar RNA)
sequencia="AUGUUUCUUAUUG"

# Dividindo a sequência em trincas (códons) e traduzindo
echo "Traduzindo a sequência: $sequencia"

# Iterando sobre a sequência de 3 em 3 caracteres
for (( i=0; i<${#sequencia}; i+=3 )); do
  # Pegando a trinca (códon)
  codon=${sequencia:$i:3}

  # Verificando se o códon existe no array associativo
  if [[ ${codon_to_amino_acid[$codon]+_} ]]; then
    # Imprimindo a trinca e o aminoácido correspondente
    echo "Códon: $codon -> Aminoácido: ${codon_to_amino_acid[$codon]}"
  else
    echo "Códon: $codon -> Aminoácido: Não encontrado"
  fi
done

```
## Explicação do código.
- Exemplo: ["AUG"]="Met" significa que o códon AUG codifica a metionina (Met).
- Sequência de Nucleotídeos: Definimos a sequência de nucleotídeos (RNA, usando "U" no lugar de "T").
- Iteração sobre a Sequência: Usamos um loop for para percorrer a sequência de nucleotídeos em blocos de 3 caracteres (códons).
- Verificação da Existência do Códon no Array: Para cada trinca, verificamos se o códon está presente no array associativo. Se estiver, imprimimos o códon e o aminoácido correspondente. Se não estiver, exibimos uma mensagem dizendo que o códon não foi encontrado.


