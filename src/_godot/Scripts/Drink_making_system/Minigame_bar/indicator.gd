extends TextureRect

###### IDEIA: Mover toda a lógica para um arquivo só no topo da arvore do sistema e deixar apenas as funções especificas nos filhos

const SPEED: float = 100

var direction: int = 1
var is_on_the_place: bool = false
var stopped: bool = true

# Minigame pai
var minigame: TextureRect = null

func _ready() -> void:
	minigame = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stopped:
		return
	
	move(delta)
	
	if Input.is_action_just_pressed("ML"):
		if is_on_the_place:
			# muda o lugar da zona amarela se acertar
			minigame.good_area.pick()
			# aumenta a qualidade se acerta
			get_parent().get_parent().get_node("Quality_bar/liquid").go_up()
			# Aumenta o tempo se acertar
			get_parent().get_parent().get_node("Hourglass").increase_time()
		else:
			# diminui a qualidade se errar
			get_parent().get_parent().get_node("Quality_bar/liquid").go_down()
			# Diminui o tempo se errar
			get_parent().get_parent().get_node("Hourglass").reduce_time()


########## Movimentação do Ponteiro ##########
# Movimenta o ponteiro de um lado para o outro de acordo com os limites predefinidos
func move(delta: float) -> void:
	# Define o movimento do ponteiro
	position.x += ((SPEED * scale.x) * delta) * direction
	
	# Define os limites de até onde o ponteiro vai
	if position.x <= minigame.bar_limiter_left.position.x:
		direction = 1
	elif position.x >= minigame.bar_limiter_right.position.x:
		direction = -1


########## Colisões ##########
# Verifica se há colisão com uma area2d
func _on_area_2d_area_entered(area: Area2D) -> void:
	# Entrou na zona amarela
	if area.get_parent() == minigame.good_area:
			is_on_the_place = true

# Verifica se acabou a colisão com uma area2d
func _on_area_2d_area_exited(area: Area2D) -> void:
	# Saiu da zona amarela
	if area.get_parent() == minigame.good_area:
			is_on_the_place = false
