# Aqui está um exemplo onde usamos um loop while para processar um arquivo com várias sequências e calcular o comprimento de cada uma.
#!/bin/bash

while read -r linha; do
    if [[ "$linha" != ">"* ]]; then
        comprimento=${#linha}
        echo "Comprimento da sequência: $comprimento"
    fi
done < sequencias.fasta
