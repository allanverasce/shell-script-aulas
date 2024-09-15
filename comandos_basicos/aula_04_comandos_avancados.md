## Comandos avançados 
São mais poderosos e permitem manipulações complexas de dados e arquivos.

1. grep: Pesquisa por padrões dentro de arquivos.
Exemplo:
```
grep "padrão" arquivo.txt
```
2. awk: Ferramenta de processamento de texto que permite a extração e manipulação de dados de arquivos baseados em colunas.
Exemplo:
```
awk '{print $1}' arquivo.txt
```
3. sed: Edita arquivos de texto de forma automatizada.
Exemplo:
```
sed 's/antigo/novo/g' arquivo.txt
```
4. find: Pesquisa arquivos e diretórios em um sistema de arquivos.
Exemplo:
```
find /home/user/ -name "*.txt"
```
5. xargs: Constrói e executa comandos a partir da entrada padrão.
Exemplo:
```
find . -name "*.txt" | xargs rm
```
6. Pipes (|): Usados para conectar a saída de um comando como entrada de outro.
Exemplo:
```
ls | grep ".sh"
```
7. Redirecionamento (> e >>): Usados para redirecionar a saída de um comando para um arquivo.
Exemplo:
```
ls > arquivos.txt   # Sobrescreve o arquivo com a lista de arquivos
ls >> arquivos.txt  # Anexa ao final do arquivo
```
