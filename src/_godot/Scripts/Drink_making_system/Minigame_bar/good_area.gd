extends TextureRect

var original_shape: Vector2 = Vector2.ZERO
var first_pick: bool = true

var minigame: TextureRect = null
@onready var collision := $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	
	minigame = get_parent()
	original_shape = collision.shape.size

func _process(delta: float) -> void:
	if first_pick:
		first_pick = false
		pick()

# Troca a área de lugar
func pick() -> void:
	_change_size()
	_change_position()
	
# Escolhe um tamanho aleatório entre 4px e 8px
func _change_size() -> void:
	var new_size = randi_range(4, 8)
	size.x = new_size
	collision.shape.size = Vector2(size.x, original_shape.y)

# Muda para um posição aleatória da barra
func _change_position() -> void:
	# Define uma posição aleatória entre os limitadores da barra
	var new_position = randi_range(minigame.bar_limiter_left.position.x + size.x, minigame.bar_limiter_right.position.x - size.x)
	position.x = new_position
	# Ajuste de posicionamento da colisão com base no pivot do colisor
	collision.position.x = size.x / 2 -.5 # O -5 é por conta de um erro de posicionamento de meio pixel
