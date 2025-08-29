## Before
- Movimentação básica do jogador em 8 direções;
- Configuração inicial na Godot.

## 07/08/25
- Assets da taverna inicial do jogo (Taverna do Mamute Velho);
- Planejamento dos próximos passos.

## 09/08/25
- Movimentação provisória do NPC viajante;
- Logica base da solicitação de bebida randomizada pelo NPC viajante;
- Classe Drink provisória e uma forma de pegar o pedido do NPC viajante.

## 18/08/25
### Minigame de Click 💚
- Lógica principal implementada:
  - Ponteiro se move de um lado ao outro da barra;
  - Clique na zona amarela aumenta barra de qualidade e tempo;
  - Clique errado diminui barra de qualidade e tempo;
  - Barra de qualidade decai constantemente;
  - Temporizador indica tempo restante.
- Sprites criados:
  - Slots do inventário;
  - Barras (click, qualidade) e ampulheta;
  - Frutas (morango, limão, cereja);
  - Coqueteleira.
- Ainda falta implementar: abertura/fechamento do minigame.

## 19/08/25
### Minigame de Click 💚
- Ajustes na lógica:
  - Quando o tempo acaba o jogo para (Ponteiro, liquido da qualidade, clicks, etc).

## 20/08/25
### Minigame de Click 💚
- Ajustes na lógica:
  - Ele abre a hud e inicia o minigame ao clicar no viajante que tem um pedido;
  - Ele fecha a hud e o minigame quando o tempo acaba.
### Próximos Passos 🎈
#### Pedido do Viajante 🧑
  - Criar as artes dos NPCs dividido em partes pra poder randozimar a personalização;
  - Programar a chegada do NPC nos seguintes passos:
    - Entrada pela porta;
    - Caminhada até o balcão;
    - Escolha da bebida;
    - Entrega do pedido;
    - Coleta to drink;
    - Ida até a mesa e esperando até terminar sua bebida;
    - Partida para fora do estabelecimento.
  - Fazer um sistema de fila para que os NPCs saibam onde ficar quando tiver outro em sua frente;
#### Minigame de Click 💚
  - Criar os sprites das três bebidas iniciais;
  - Fazer a lógica de escolher os ingredientes antes do minigame começar;
  - Mostra o drink finalizado antes do minigame fechar;
  - Criar a lógica que armazena no drink a pontuação e a qualidade do drink quando o minigame acaba.
#### Geral 🧶
  - Refatorar o código;
  - Animar;
  - Adicionar efeitos visuais;
  - Adicionar efeitos sonoros;
  - Refinar o restante.

## 27/08/25
### Pedido do Viajante 🧑
  - Configuração básica da movimentação do viajante até o bar usando Path-Finding (A*);
  - Solicitação da bebida;
#### Geral 🧶
  - Criação do sprite do jogador;
  - Refatoração do código do viajante;
  - Separação de responsabilidades de alguns códigos do sistema de pedido de bebida;

## 28/08/25
### Pedido do Viajante 🧑 -> Ciclo do Viajante na Taverna 🧑
  - Lógica do comportamento do NPC na taverna:
    - Entrar na taverna;
    - Ir até o bar;
    - Pedir uma bebida;
    - Receber a bebida;
    - Ir até uma mesa;
    - Beber;
    - Escolher se quer beber mais ou ir embora.
    - OBS: A lógica está completa. Toda a base do código está pronta para ser expandida.