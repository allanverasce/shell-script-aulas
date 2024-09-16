## Aula 05 - Estruturas Condicionais (if-else)
As estruturas condicionais if-else são utilizadas para executar blocos de código diferentes dependendo de uma condição. Em biologia computacional, isso pode ser útil para verificar, por exemplo, se um dado genômico contém uma sequência específica ou para categorizar dados conforme condições biológicas.

### Exemplo aplicado à biologia:
Imaginemos que você está processando dados de sequências genômicas, e precisa verificar se uma sequência contém uma determinada mutação, como a presença de uma substituição de base.

```
#!/bin/bash

sequencia="ATGCATGGAC"

if [[ "$sequencia" == *"A"* ]]; then
    echo "A mutação está presente!"
else
    echo "A mutação não foi encontrada."
fi
```
