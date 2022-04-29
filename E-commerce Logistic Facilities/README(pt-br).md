# E-Commerce Logistic Problem



## Descrição da Operação

Esse projeto apresenta o funcionamento atual de empresas de comércio eletrônico, utilizando a estratégia de marketplace combinada ou não com produtos próprios. Múltiplos centros logísticos armazenam produtos próprios e de terceiros, que são vendedores que utilizam o site e a operação logística para comercializar seus produtos. 

Os centros logísticos realizam as operações de armazenagem e e envio. As operações de armazenagems constituem no recebimento, desenbalagem, acondicionamento e armazenamento seguro e rastreado das mercadorias. As operações de envio constituem no recebimento do pedido de envio, seleção, coleta, embalagem e carregamento em veículos de transporte e entrega.

A ideia dos centros logísticos é realizar todas as operações necessárias para armazenar e entregar as mercadorias comercializadas em um site, de maneira rápida e econômica. A rapidez está na possibilidade de automação dos processos de armazenagem e de envio, e da localização desses centros logísticos em múltiplas regiões, próximas aos clientes. A economia está na utilização de tecnologia de última geração por todos os vendedores, pequenos ou grandes, utilizando processos e tecnologias modernas de forma compartilhada.

Várias empresas de e-Commerce estão utilizando essa arquitetura logística por permitir oferecer ampla variedade de mercadorias aos clientes finais, redução de custos logísticos, tempos de entrega menores, escalabilidade e flexibilidade para atuar com vendedores de portes muito distintos. Empresas como Amazon e Mercado Livre operam dessa forma.

## Problema

Ecomole® é uma empresa de comércio eletrônico espeializada no modelo marketplace, ou seja, vendedores (outras lojas) utilizam a plataforma online da Ecomole, serviço ao consumidor e infraestrutura, como centros de distribuição, em que no contexto de marketplace são chamados de "Centros de atendimento" (CA), para armazenar e vender seus produtos. Neste modelo, os CAs tem um papel importante pois pois não somente permitem ao vendedor operar sem the um espaço físico de armazenar seus produtos, mas ele também despacha o transporte de mercadorias como de acordo com a decisão da Ecomole sobre qual CA irá atender melhor a demanda de cada produto. Um dos principais problemas no gerenciamento dos CAs é decidir onde cada produto deve ser armazenado para, após os vendedores entregarem em algum CA, com o objetivo de maximizar o lucro da Ecomole. Atualmente, a infraestrutura da Ecomole é formada por 3 centros de atendimento, apoiando um total de 50 vendedores em que, juntos, oferecem 300 produtos em 5 categorias (eletrônicos, supermercado, casa, linha branca e moda).

À seguir você pode encontrar informação adicional nos processos e políticas de um centro de atendimento.

* **Sales:**
  - A demanda e o preço (dollar por unidade) é conhecido para cada produto e estado.
  - Um percentual de cada venda (markup) fica com a Ecomole.
  - Existe um tempo associado <i>t<sub>lm</sub></i> e um custo  <i>c<sub>lm</sub></i> de entregar um produto de um CA para um cliente. 

* **Stock:**
  - There is a cost <i>c<sub>st</sub></i>, para cada dia que uma unidade de produto é mantida armazenada em um CA.
  - Cada produto tem um estoque de segurança, prametrizada por um número de dias d, em que um estoque mínimo deve estar disponível, todo o tempo, e igual a uma previsão de demanda de d dias de vendas.

* **Transferências:**
  - Transferir produtos entre os CAs tem um custo associado de <i>c<sub>fc</sub></i> e um tempo <i>t<sub>fc</sub></i>.

* **Recebimento de mercadorias**
  - Cada CA tem um custo <i>c<sub>is</sub></i> relacionado ao descarregamento de uma carga de mercadorias enviada pelos vendedores.



Considerando a configuraçao da Ecomole, como descrita acima, responda as seguintes questões.

a) Qual transferência de produtos entre CAs maximiza o lucro da Ecomolo enquanto atende todas as demandas e respeita as políticas de estoques?

b) Ecomole quer implantar uma política de entrega de 2-dias, ou seja, todos os produtos devem ser entregues ao consumidor dentro de dois dias após sair do CA.

​	i. Qual o impacto dessa política no lucro?

​	ii. Quando a empresa pode mitigar desse impacto? Proponha novos custos e variáveis.

c) Com o objetivo de aumentar sua lucratividade, Ecomole está aberta a rever sua política de estoques. Quais novas políticas, e seus impactos, podem ser implementadas?

d) Após a política de entrega em até 2 dias ser implementada, Ecomole descobriu que as vendas são uma função de tempo de entrega (veja a aba vendas - por - entrega ). O que deve ser modificado na abordagem desenvolvida anteriormente para atender essa consideração? Não há necessidade de implementar essas mudanças.

e) Durante a pandemia de COVID-19, houve uma grande expansão da infraestrtura da Ecomole que agora é formada por 10 CAs, apoiando 100k vendedores, vendendo 200M de produtos em 1k categorias. Como você adaptaria a soluçao desenvolvida com o objetivo de considerar o crescimento da Ecomole (você não precisa implementar essas adaptações)?
