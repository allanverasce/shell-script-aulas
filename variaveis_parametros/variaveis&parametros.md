# Definindo Variáveis e Passando Parâmetros no seu Script

## 1. Definindo Variáveis em Shell Script

Para definir uma variável em um shell script, você deve usar a seguinte sintaxe:

```bash
NOME_DA_VARIAVEL=valor
```
Exemplo: 

```
nome="Allan Veras, seu professor preferido kkk"
idade=30
```
### Notas sobre variáveis
- Não deve haver espaços ao redor do sinal de igual = ao definir uma variável.
- As variáveis são sensíveis a maiúsculas e minúsculas.

## 2. Utilizando Variáveis em Shell Script
Para utilizar uma variável definida, você deve precedê-la com o caractere $:

```
echo "Meu nome é $nome e tenho $idade anos."
```

## 3. Passando Parâmetros em Linha de Comando
Você pode passar parâmetros para um script de shell ao chamá-lo. Os parâmetros são acessíveis dentro do script usando $1, $2, $3, etc.

Exemplo de chamada do script:
```
./meu_script.sh parametro1 parametro2
```
## 4. Utilizando Parâmetros no Script
Dentro do script, você pode acessar os parâmetros da seguinte forma:

```
#!/bin/bash
parametro1=$1
parametro2=$2

echo "O primeiro parâmetro é: $parametro1"
echo "O segundo parâmetro é: $parametro2"
```

# Exemplos de Operações com Variáveis e Parâmetros em Shell Script

## 1. Operações Aritméticas

### Exemplo: Cálculo da Soma

```bash
#!/bin/bash

# Recebendo dois números como parâmetros
num1=$1
num2=$2

# Calculando a soma
soma=$((num1 + num2))

# Exibindo o resultado
echo "A soma de $num1 e $num2 é: $soma"
```
Vamos ampliar um pouco ...
```
#!/bin/bash

# Verificando se dois números foram fornecidos como parâmetros
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <num1> <num2>"
    exit 1
fi

# Recebendo os números como parâmetros
num1=$1
num2=$2

# Calculando as operações
soma=$((num1 + num2))
subtracao=$((num1 - num2))
multiplicacao=$((num1 * num2))

# Verificando se o segundo número é zero para evitar divisão por zero
if [ "$num2" -eq 0 ]; then
    divisao="Erro: Divisão por zero não é permitida."
else
    divisao=$((num1 / num2))
fi

# Exibindo os resultados
echo "Você forneceu os números: $num1 e $num2"
echo "A soma de $num1 e $num2 é: $soma"
echo "A subtração de $num1 e $num2 é: $subtracao"
echo "A multiplicação de $num1 e $num2 é: $multiplicacao"
echo "A divisão de $num1 por $num2 é: $divisao"
```

## 2. Operações de Manipulação de Strings
Exemplo: Concatenação de Strings
```
#!/bin/bash

# Recebendo dois nomes como parâmetros
nome1=$1
nome2=$2

# Concatenando os nomes
nome_completo="$nome1 $nome2"

# Exibindo o nome completo
echo "O nome completo é: $nome_completo"
```

