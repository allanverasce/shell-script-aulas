# Comando `case` no Shell Script

O comando `case` no shell script é usado para realizar comparações simples de valores com base em padrões. Ele é uma alternativa eficiente ao uso de múltiplas estruturas `if-elif-else`, principalmente quando existem várias condições possíveis. O `case` compara uma variável a um conjunto de padrões e executa o bloco de código correspondente ao padrão que for satisfeito.

Sintaxe

```
case palavra in
  padrão1)
    # Comandos se padrão1 for satisfeito
    ;;
  padrão2)
    # Comandos se padrão2 for satisfeito
    ;;
  *)
    # Comandos se nenhum dos padrões anteriores for satisfeito
    ;;
esac
```

- palavra: é a variável ou expressão que será comparada.
- padrão: é o valor ou expressão regular que será comparada com palavra.
- ;;: é o delimitador de finalização para cada bloco de comandos.

Exemplo Genérico
Aqui está um exemplo básico de um script que pergunta o dia da semana e responde com uma mensagem apropriada usando case.

```
#!/bin/bash

echo "Digite o dia da semana (seg, ter, qua, etc.):"
read dia

case $dia in
  seg)
    echo "Hoje é segunda-feira!"
    ;;
  ter)
    echo "Hoje é terça-feira!"
    ;;
  qua)
    echo "Hoje é quarta-feira!"
    ;;
  qui)
    echo "Hoje é quinta-feira!"
    ;;
  sex)
    echo "Hoje é sexta-feira!"
    ;;
  sab|dom)
    echo "Hoje é fim de semana!"
    ;;
  *)
    echo "Entrada inválida!"
    ;;
esac
```

### Explicação:
- O script lê a entrada do usuário e compara com os padrões. (usando a função read para capturar a entrada via teclado)
- Se o dia for "seg", ele responde com "Hoje é segunda-feira!".
- Para dias de fim de semana ("sab" ou "dom"), ele exibe "Hoje é fim de semana!".
- O * (curinga) captura qualquer outra entrada e responde com "Entrada inválida!".

## Exemplo Aplicado à Biologia
Em um contexto biológico, podemos usar o comando case para automatizar processos comuns, como o tratamento de arquivos FASTA/FASTQ com diferentes tipos de sequências.
Exemplo: Verificar Tipo de Sequência (DNA, RNA, Proteína)
Este exemplo de script determina o tipo de sequência biológica com base em sua composição de nucleotídeos ou aminoácidos.

```
#!/bin/bash

echo "Digite a sequência (DNA, RNA ou Proteína):"
read sequencia

# Remove caracteres especiais e converte para maiúsculas
sequencia=$(echo "$sequencia" | tr -d '\n\r' | tr 'a-z' 'A-Z')

# Verifica o tipo de sequência
case $sequencia in
  # Verifica se contém caracteres específicos de aminoácidos (excluindo A, C, G, T, U)
  *[EFILPQZ]* | *[HKMRVWXY]*)
    echo "A sequência contém aminoácidos, é uma proteína."
    ;;
  # Verifica se contém Timina (T), típico do DNA
  *[T]*)
    echo "A sequência contém timina (T), é DNA."
    ;;
  # Verifica se contém Uracila (U), típico do RNA
  *[U]*)
    echo "A sequência contém uracila (U), é RNA."
    ;;
  # Se não corresponde a nenhuma das opções acima
  *)
    echo "Entrada inválida ou sequência desconhecida!"
    ;;
esac
```
