# Aula 02: Criando seu Primeiro Script no Linux

## Objetivo
Nesta aula, você vai criar seu primeiro script em Shell e aprender como executá-lo no terminal.

## Passo 1: Criando o Script
1. Abra o terminal e use o editor de texto de sua escolha (como `nano` ou `vim`) para criar um arquivo chamado `hello_world.sh`.
   
   No terminal, execute:
   ```bash
   nano hello_world.sh

2. Dentro do editor de texto, adicione o seguinte código:
   ```bash
   #!/bin/bash
   echo "Olá, Mundo!"

-  #!/bin/bash: Essa linha indica que o script deve ser interpretado pelo Bash.
-  echo: Este comando exibe a mensagem "Olá, Mundo!" no terminal.

## Passo 2: Salvando e Saindo
   Para salvar o arquivo no nano, pressione CTRL + O, depois ENTER, e então CTRL + X para sair.

## Passo 3: Dando Permissão de Execução
   Para poder executar o script, precisamos garantir que ele tenha permissão de execução. No terminal, execute o seguinte comando:
   
     ```bash
    chmod +x hello_world.sh

## Passo 4: Executando o Script
Agora, você pode executar seu script com o comando:

   ```bash
   ./hello_world.sh

OU

   ```bash
   bash hello_world.sh

Isso imprimirá a mensagem "Olá, Mundo!" no terminal.
