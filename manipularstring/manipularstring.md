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
