# Scripts Parametrizados
## O que são Scripts Parametrizados?
<p align="justify">Scripts parametrizados são scripts que podem receber entradas (parâmetros) diretamente da linha de comando quando executados. Isso permite que o script seja mais flexível, pois pode ser usado para diferentes cenários sem a necessidade de editar o código.</p>

Sintaxe de Scripts Parametrizados:
No Bash, os parâmetros são referenciados com `$1`, `$2`, etc., onde `$1` é o primeiro argumento passado para o script, `$2` é o segundo, e assim por diante.

```
#!/bin/bash

# Exemplo de uso de parâmetros
echo "O primeiro parâmetro é: $1"
echo "O segundo parâmetro é: $2"
```
Exemplo Genérico de Script Parametrizado:

```
#!/bin/bash
# Script que imprime uma mensagem personalizada
nome=$1
mensagem=$2

echo "Olá, $nome! $mensagem"
```
Veja como usar no terminal ...

```
./meu_script.sh Maria "Bem-vinda ao nosso sistema"
```

## Exemplo aplicado a Biologia
Aqui está um exemplo onde um script recebe como parâmetros o nome de um arquivo FASTA e o nome de um banco de dados para realizar uma análise BLAST.

```
#!/bin/bash

# Verifica se dois parâmetros foram passados
if [ "$#" -ne 2 ]; then
  echo "Uso: $0 <arquivo_fasta> <banco_dados>"
  exit 1
fi

arquivo_fasta=$1
banco_dados=$2

# Executa BLAST com os parâmetros fornecidos
blastn -query "$arquivo_fasta" -db "$banco_dados" -out resultado_blast.txt

echo "Análise BLAST finalizada. Resultados salvos em resultado_blast.txt."
```
### Dicas do Allan 
- Sempre verifique se os parâmetros necessários foram passados antes de executar o script.
- Use parâmetros para flexibilizar scripts e adaptá-los a diferentes situações.
- Combine scripts parametrizados com funções para criar pipelines mais robustos.


