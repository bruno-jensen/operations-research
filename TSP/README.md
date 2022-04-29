## TSP - Capitais Brasileiras

O Problema do Caixeiro Viajante (Traveling Salesperson - TSP) é um dos mais famosos problemas de otimização combinatória. Este problema é muito fácil de explicar, mas muito complicado de resolver - mesmo para casos com um pequeno número de cidades.

A origem do problema do caixeiro viajante não é muito clara; ele chega a ser mencionado em um manual de 1832 para caixeiros-viajantes, que incluía exemplos de passeios por 45 cidades alemãs, mas não foi formulado originalmente como um problema matemático. No entanto, em 1800, os matemáticos William Rowan Hamilton e Thomas Kirkman criaram formulações matemáticas do problema.

O TSP pode ser definido da seguinte forma: para uma determinada lista de cidades e as distâncias entre cada par delas, queremos encontrar a rota mais curta possível, que vai a cada cidade uma vez e retorna à cidade de origem.

Existe uma classe de Problemas de Pessoa Caixeira Viajante que assume que a distância de ir da cidade *i*  à cidade *j* é a mesma que ir da cidade *j* à cidade *i*, este tipo de TSP também é conhecido como TSP simétrico. Para o seguinte cenário sugerimos usar distâncias euclidianas, mas a formulação do modelo TSP é válida independentemente da forma como as distâncias individuais são determinadas.

A programação matemática é uma abordagem declarativa em que o modelador formula um modelo de otimização matemática que captura os principais aspectos de um problema de decisão complexo. 

Um modelo de otimização matemática tipicamente vai possuir cinco componentes, a saber:

* Conjuntos e índices;
* Parâmetros;
* Variáveis de decisão;
* Função (ões) objetivo (s);
* Quaisquer restrições.

Faça uma formulação de TSP que identifique a rota mais curta para as capitais brasileiras, que vai a todas as cidades uma vez e retorna à cidade de origem. Os os arquivos a serem utilizados, contendo os dados das capitais brasileiras a serem utilizados nesse cenário, são encontrados em `.../Input Data`.

states_coords.csv: contém a latitude e longitude de cada capital de estado brasileiro;
states_line.json: contém o nome dos estados e a distância em km de todos os pares possíveis assumindo uma linha conectando as cidades;
states_gmaps.json: contém o nome dos estados e a distância em km de todos os pares possíveis com as informações do Google a respeito.