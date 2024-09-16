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
8. apt, yum: São exemplos de gerenciadores de intalação inteligentes. Eles servem também para atualizar e remover os softwares (pacotes). É importante, ressaltar que cada distribuição adota um próprio, estes ai são exemplos, no caso do apt é mais comum a distribuições que usam o Debian (Ubuntu, Linux Mint) como base.

Exemplo:
```
sudo apt install gimp
sudo yum install gimp
```
9. wc:  Este comando vem de “word count”, ele exibe o número de palavras em um arquivo de texto:
Exemplo:
```
wc TranscriptRun.txt 
52  256 3433 TranscriptRun.txt
```
O resultado é organizado desta forma: 52 (número de linhas) 256 (palavras) 3433 (tamanho em bytes) e por fim, nome do arquivo.

10. 
