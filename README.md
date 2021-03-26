# Design Pattern Strategy

### O padrão Strategy sugere que você pegue uma classe que faz algo específico de várias maneiras diferentes e extraia todos esses algoritmos em classes separadas chamadas de estratégias.

## Exemplos de uso

- Algoritmos de classificação - cada algoritmo (por exemplo, classificação por bolha, classificação rápida, etc.) é extraído em uma classe separada, uma interface comum é definida e fornece um método sort ();
- Estratégias de pagamento - você deseja definir diferentes opções de pagamento em seu código (pagamento móvel, transferência bancária, dinheiro, cartão de crédito, etc.) e utilizá-las de acordo com a seleção do usuário;
- Cálculo de dano no jogo RPG - existem vários tipos diferentes de ataque no jogo, por exemplo, atacando com diferentes movimentos, combos, feitiços, usando armas, etc. Vários algoritmos diferentes podem ser definidos para cada tipo de ataque e o valor do dano pode ser calculado com base em o contexto.


 ## Aplicabilidade
 
 ### Utilize o padrão Strategy quando você quer usar diferentes variantes de um algoritmo dentro de um objeto e ser capaz de trocar de um algoritmo para outro durante a execução.
 O padrão Strategy permite que você altere indiretamente o comportamento de um objeto durante a execução ao associá-lo com diferentes sub-objetos que pode fazer sub-tarefas específicas em diferentes formas.

 ### Utilize o Strategy quando você tem muitas classes parecidas que somente diferem na forma que elas executam algum comportamento.
 O padrão Strategy permite que você extraia o comportamento variante para uma hierarquia de classe separada e combine as classes originais em uma, portando reduzindo código duplicado.

 ### Utilize o padrão para isolar a lógica do negócio de uma classe dos detalhes de implementação de algoritmos que podem não ser tão importantes no contexto da lógica.
 O padrão Strategy permite que você isole o código, dados internos, e dependências de vários algoritmos do restante do código. Vários clientes podem obter uma simples interface para executar os algoritmos e trocá-los durante a execução do programa.

### Utilize o padrão quando sua classe tem um operador condicional muito grande que troca entre diferentes variantes do mesmo algoritmo.
 O padrão Strategy permite que você se livre dessa condicional ao extrair todos os algoritmos para classes separadas, todos eles implementando a mesma interface. O objeto original delega a execução de um desses objetos, ao invés de implementar todas as variantes do algoritmo.
 
 ### Prós
 Você pode trocar algoritmos usados dentro de um objeto durante a execução.
 Você pode isolar os detalhes de implementação de um algoritmo do código que usa ele.
 Você pode substituir a herança por composição.
 Princípio aberto/fechado. Você pode introduzir novas estratégias sem mudar o contexto.
 
 ### Contras
 Se você só tem um par de algoritmos e eles raramente mudam, não há motivo real para deixar o programa mais complicado com novas classes e interfaces que vêm junto com o padrão.
 Os Clientes devem estar cientes das diferenças entre as estratégias para serem capazes de selecionar a adequada.
 Muitas linguagens de programação modernas tem suporte do tipo funcional que permite que você implemente diferentes versões de um algoritmo dentro de um conjunto de funções anônimas. Então você poderia usar essas funções exatamente como se estivesse usando objetos estratégia, mas sem inchar seu código com classes e interfaces adicionais.
 
 
 # Exemplo usado
 
 É um simples sistema que você pode escolher qual frete vai usar e ele faz o calculo automaticamente!
 
 ### libs
 
 faker -> Usado para criar o nome dos pedidos de forma aleatória
