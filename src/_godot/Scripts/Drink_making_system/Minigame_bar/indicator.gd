extends TextureRect

const SPEED: float = 100

var direction: int = 1
var is_on: bool = false

# Partes do minigame
var minigame: TextureRect = null

func _ready() -> void:
	minigame = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Define o movimento do ponteiro
	position.x += ((SPEED * scale.x) * delta) * direction
	
	# Define os limites de até onde o ponteiro vai
	if position.x <= minigame.bar_limiter_left.position.x:
		direction = 1
	elif position.x >= minigame.bar_limiter_right.position.x:
		direction = -1
	
	if Input.is_action_just_pressed("ML"):
		if is_on:
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

func _on_area_2d_area_entered(area: Area2D) -> void:
	# Entrou na área boa
	if area.get_parent() == minigame.good_area:
			is_on = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	# Saiu da área boa
	if area.get_parent() == minigame.good_area:
			is_on = false
