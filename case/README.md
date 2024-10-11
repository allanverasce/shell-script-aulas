# Comando `case` no Shell Script

O comando `case` no shell script é usado para realizar comparações simples de valores com base em padrões. Ele é uma alternativa eficiente ao uso de múltiplas estruturas `if-elif-else`, principalmente quando existem várias condições possíveis. O `case` compara uma variável a um conjunto de padrões e executa o bloco de código correspondente ao padrão que for satisfeito.

Sintaxe

```bash
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
