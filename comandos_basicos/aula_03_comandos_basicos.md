## Comandos básicos 
São aqueles necessários para operar em um sistema Linux e navegar por seus diretórios. Alguns exemplos:

1. ls: Lista os arquivos e diretórios no diretório atual.

Exemplo:
  ```
  ls
  ```

2. cd: Altera o diretório atual.

Exemplo:
```
cd /home/user/
```
Temos outros usos do comando cd. Caso queira sair do diretório corrente, basta usar o commando.
```
cd ..
```


3. mkdir: Cria um novo diretório.

Exemplo:
```
mkdir projetos
```

4. cat: Exibe o conteúdo de um arquivo no terminal.

Exemplo:
```
cat arquivo.txt
```
5. rm: Remove um arquivo ou diretório.

Exemplo:
```
rm arquivo.txt
```
6. cp: Copia arquivos ou diretórios.

Exemplo:
```
cp arquivo.txt /home/user/documentos/
```
7. mv: Move ou renomeia arquivos ou diretórios.

Exemplo:
```
mv arquivo.txt /home/user/documentos/
```
8. pwd: Mostra o diretório atual em que você está.

Exemplo:
```
pwd
```
9. clear: limpa a tela (mesma coisa de usar CLS no DOS)

Exemplo:
```
claer
```
10. chmod : Este comando é utilizado para alterar as permissões de um arquivo ou diretório.
<p align="justify">As permissões no Linux são categorizadas em : permissões de dono do arquivo (usuário, representado pela letra u), permissões de grupo, usuários que são membros do mesmo grupo do arquivo (g), e por fim, permissões de usuários que não membros do grupo do arquivo (o).</p>
  
Veja o exemplo, usando o comando ls -lha, para ver detalhes sobre o arquivo:
#### -rw-r--r-- 1 allan allan 13 set 15 18:30 cat_create

As permissões básicas que um arquivo pode ter são:
- r (read)
- w (write)
- x (execute)

Exemplo:
```
chmod +x SeuScript.sh
```
Este comando pode ser utilizando com código numérico
0 = sem permissão
1 = somente execução
2 = somente gravar
3 = gravar e executar
4 = somente ler
5 = ler e executar
6 = ler e gravar
7 = ler, executar e gravar

Exemplo: Neste exemplo é dada permissão total ao script: leitura , execução e gravação
```
chmod 777 SeuScrit.sh
```
11.  sudo: Este comando e permite que você aja como um superusuário ou usuário root na execução de um comando específico ou script.
Exemplo

```
sudo apt install hplib
sudo cd /root/
```
