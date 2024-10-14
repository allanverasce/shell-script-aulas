### Exercício: Implementação das Etapas de Trimagem e Filtro de Qualidade no Processo de Montagem de Genoma

O processo de montagem de genomas envolve várias etapas fundamentais, que permitem a limpeza e organização das leituras brutas para garantir a qualidade dos dados. As principais etapas são:

1. **Avaliação de Qualidade**: Nesta fase, as leituras brutas (raw reads) são analisadas para determinar sua qualidade. A partir dessa análise, estratégias podem ser desenvolvidas para o corte (trimagem) de bases de baixa qualidade.

2. **Trimagem**: As bases de baixa qualidade nas extremidades das sequências são removidas. A trimagem pode ocorrer no início, no fim ou em ambas as extremidades das leituras.

3. **Filtro de Qualidade**: Após a trimagem, as leituras passam por um filtro de qualidade. Caso a qualidade média de uma sequência seja inferior a um valor de corte pré-definido, essa sequência é removida.

### Tarefa:

Implemente as etapas 2 (Trimagem) e 3 (Filtro de Qualidade) usando o software **fastq-toolkit** em um **script shell**. O script deve:

- Realizar a **trimagem** das bases de baixa qualidade nas extremidades das sequências FASTQ.
- Aplicar um **filtro de qualidade**, removendo as sequências cuja qualidade média esteja abaixo de um valor de corte.

#### Requisitos:
1. Utilize o software **fastq-toolkit** para realizar ambas as etapas.
2. O script deve receber como parâmetros:
   - O arquivo FASTQ de entrada.
   - O valor de qualidade de corte.
   - Como vamos analisar dados NGS então vamos trimar apenas do final da sequência.
3. Ao final, o script deve gerar um arquivo FASTQ com as sequências filtradas e trimadas.
4. Inclua comentários no script explicando cada etapa.

Obs: Já esta disponível no github o script que realiza a avaliação de qualidade.
