# Vamos explorar o comando sed.

<p align="justify">O comando sed (Stream Editor) é uma poderosa ferramenta de manipulação de texto no Linux, usada para buscar, substituir, adicionar ou remover linhas e padrões em arquivos de forma não interativa. Ele permite que você processe fluxos de dados ou arquivos sem a necessidade de abrir esses arquivos diretamente. O sed é muito útil em automação de tarefas, especialmente quando combinando com scripts em Bash.</p>

### Estrutura básica do sed (Sintaxe)
A estrutura básica do comando sed é:
```
sed [opções] 'script' arquivo
```
Aqui, o script pode ser uma simples substituição, como s/padrão/substituição/, e o arquivo é o arquivo de texto onde a operação será aplicada.

### Aplicações e exemplos práticos
<p align="justify">Substituição simples de texto A operação mais comum do sed é a substituição. O formato básico é s/padrão/substituição/, onde s significa "substituir", seguido pelo padrão a ser encontrado e o texto de substituição.</p>

Conteúdo do arquivo frutas.txt
- maçã
- banana
- maçã verde
- uva
- laranja

Exemplo:
```
sed 's/maçã/laranja/' frutas.txt
```
Alterando múltiplos arquivos O sed também pode ser utilizado em múltiplos arquivos ao mesmo tempo:

```
sed -i 's/antigo/novo/g' *.txt
```
Excluir linhas que contêm um padrão O sed pode excluir linhas com base em padrões:

```
sed '/maçã/d' frutas.txt
```

Inserir texto após um padrão O sed pode adicionar linhas de texto após encontrar um padrão: (To sabendo que já ia perguntar, né??)

```
sed '/maçã/a\Esta é uma fruta' frutas.txt
```
Neste exemplo, ele insere "Texto adicional" após a linha que contém o "padrão".

Substituindo texto entre um intervalo de linhas. Você pode aplicar alterações apenas em um intervalo específico de linhas:

```
sed '2,4s/maçã/laranja/' frutas.txt
```
Aqui, as linhas 2 a 4 terão "maçã" substituído por "laranja".







