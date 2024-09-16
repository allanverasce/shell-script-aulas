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

