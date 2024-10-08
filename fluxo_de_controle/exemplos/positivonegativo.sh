#Neste exemplo, criamos um script que recebe um número como argumento e verifica se é positivo, negativo ou zero.

#!/bin/bash
# Recebe o número como argumento
num=$1

# Verifica se o número é maior, menor ou igual a zero
if [ $num -gt 0 ]; then
    echo "$num é um número positivo"
elif [ $num -lt 0 ]; then
    echo "$num é um número negativo"
else
    echo "$num é zero"
fi
