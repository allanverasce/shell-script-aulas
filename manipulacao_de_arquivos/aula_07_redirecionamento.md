# Aula 07 - Redirecionamento de Entrada e Saída

O redirecionamento é uma técnica utilizada para alterar as fontes de entrada e saída padrão dos comandos no terminal.

### Sintaxe Básica

- `>`: Redireciona a saída padrão para um arquivo (sobrescreve o arquivo).
- `>>`: Redireciona a saída padrão para um arquivo (anexa ao final do arquivo).
- `<`: Redireciona a entrada padrão de um arquivo.
- `|`: Usado para "pipe", conecta a saída de um comando à entrada de outro.

### Exemplo 

### Sobrescrever a saída em um arquivo:

```
echo "Olá, Mundo!" > mensagem.txt
```
Exemplo Aplicado à Biologia
<p align="justify">Imagine que você tenha um arquivo de resultados de sequenciamento de DNA (sequencia.txt) e deseja redirecionar as sequências que contêm "ATG" para outro arquivo:</p>

```
grep "ATG" sequencia.txt > sequencias_filtradas.txt
```
### Usando Pipes para Processamento de Sequências:
Você pode combinar comandos para processar sequências de forma mais complexa. Por exemplo, contar o número de sequências que começam com "ATG":

```
grep "^ATG" sequencia.txt | wc -l
```
Vamos pra explicação do que esta linha esta fazendo:
- grep "^ATG" filtra as linhas que começam com "ATG".
- | wc -l conta quantas dessas linhas existem.

