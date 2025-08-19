# Attend System
## Ask Taking System
- O cliente chega ao balcão;
- Ele faz o pedido;
- O jogador clica nele para atender;
- Uma caixa de dialogo vai aparecer com o pedido dele. Junto vai aparecer opções de resposta que são: [Resposta positiva para aceitar o pedido] e [Resposta negativa para recusar];
- Se o jogador não tiver os ingredientes vai aparecer apenas a resposta negativa para recusar dizendo que não tem ingredientes o sulficiente;

## Drink Making System
- Ao receber o pedido o jogador muda de sprite para um segurando a coqueteleira;
- A tela fica com blur para focar na hud que vai aparecer de cima pra baixo;
- Surge um inventario no lado esquerdo para selecionar os ingredientes, uma coqueteleira no lado direito e na parte de cima os ingredientes necessários meio opacos;
- Ao selecionar os ingredientes eles vão ficando com a coloração mais viva na barra de necessários;
- Ao terminar de selecionar todo eles vão ir para dentro da coqueteleira que irá fechar;
- A coqueteleira começará a ser chacoalhada de vagar e uma barra com uma área verde e um ponteiro que irá de um lado para o outro aparecerão na parte de baixo da tela;
- Um sprite do rosto do cliente aparecerá no lado direiro junto com uma barra de satisfação e a coqueteleira irá para o centro da tela;
- O jogador dele clicar na tela quando o ponteiro estiver na barra verde;
- Se o jogador errar a coqueteleira irá abrir um pouco e derrubar o liquido e a satisfação do cliente irá diminuir. Se acertar ela vai chacoalhar mais rapido ou fazer uma manobra;
- Uma barra de tempo começará a decair enquanto o jogador não clica. Se o jogador clicar e acertar ela recupera um pouco de tempo, se errar ela decai mais;
- Quando o tempo acabar, as barras sumirão perdendo a opacidade e uma animação servindo em uma caneca começará. Depois a Hud vai subir para cima e a tela vai perder o blur.
- O cliente vai mostrar a sua satisfação ou insatisfação, pegar a bebida e sair;

### Step by step
- Criar um prototipo em C# da logica do sistema;
- Criar o sprite da coqueteleira e a animação;
- Criar o sprite do inventario do HUD (Primeira ideia: Um armario com os ingredientes nas prateleiras. As prateleiras são predefinidas com todos os ingredientes do jogo, mas os ingredientes não descobertos aparecem com o sprite todo preto.);
- Criar os sprites das barras (Barra de minigame, barra de satisfação do cliente, barra de tempo, barra com os itens necessários, criar um icone padrão de satisfação do cliente);
- Criar os objetos necessários na Engine;
- Adaptar o código para a Engine.


📑 Sugestão de Quebra Modular do Planejamento
1. Sistema de Cliente
- Separar a parte de chegada, pedido e saída em blocos.
- Spawn do cliente → entrar pela porta e ir até o balcão.
- Estado de espera no balcão → fica aguardando até ser clicado.
- Interação de pedido → caixa de diálogo com opções de aceitar/recusar.
- Estado de consumo (para o futuro) → sentar, beber, conversar.
- Despawn → cliente vai embora após terminar.

Vantagem: Você pode testar o ciclo "spawn → pedido → despawn" sem precisar ter o minigame funcionando ainda.

2. Sistema de Pedido
- Definição do pedido → sorteia uma bebida da lista (pode ser mock, não precisa ter todas).
- Verificação de ingredientes → retorna quais estão disponíveis.
- Resposta do jogador → aceitar ou recusar.

Vantagem: Com isso pronto, você já pode testar o comportamento de múltiplos clientes pedindo ao mesmo tempo.

3. Sistema de Preparação (Minigame)
- Separar em três micro-módulos:
- Seleção de ingredientes:
- Inventário visível (prateleiras).
- Itens ocultos para ingredientes não descobertos.
- Marcação visual dos ingredientes corretos.
- Animação da coqueteleira:
- Fechar coqueteleira.
- Começar movimento.

Minigame:
- Ponteiro e barra verde.
- Barra de tempo.
- Reação a acerto e erro (incluindo derramar líquido).

Vantagem: Se mais tarde você quiser mudar o minigame (ex.: aquecimento, mexer), basta substituir essa parte sem refazer todo o sistema.

4. Sistema de Feedback
- Barra de satisfação → aumenta/diminui conforme acertos.
- Animação de reação do cliente (feliz, neutro, insatisfeito).
- Resultado final → cliente pega bebida e sai.

5. Base Técnica
- Sistema de profundidade/sobreposição (já está nos teus planos).
- Gerenciador de estados para clientes (spawn, pedir, consumir, sair).
- Gerenciador de HUDs para trocar entre inventário e minigame sem travar a cena principal.

💡 Outras Sugestões
- Mock de ingredientes: no início, não precisa programar todos os ingredientes — 2 ou 3 já é suficiente pro protótipo rodar.
- Satisfação simplificada: barra de 0 a 3 níveis (triste, neutro, feliz) ao invés de porcentagem, só pra testar o fluxo.
- Sistema de fila (mesmo que simples): já deixa preparado para vários clientes entrarem e aguardarem, pra ver se a lógica segura bem.
- Modularização máxima: cada parte do ciclo (pedido, preparação, entrega) pode ser isolada e testada de forma independente.

## Done and To do
- Fiz a logica de pedido do NPC. X
- Fazer a classe bebida com um nome e receita e depois criar três objetos para diferentes drinks;
- Juntar a nova classe drink com a logica de pedido.