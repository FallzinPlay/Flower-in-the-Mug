extends TextureRect


@onready var timer:= $Timer
@onready var text:= $Text

var drink_hud: Panel = null
var ponteiro: TextureRect = null
var quality_liquid: TextureRect = null

func _ready() -> void:
	ponteiro = get_parent().get_parent().get_node("scaler/Minigame_bar/Indicator")
	quality_liquid = get_parent().get_parent().get_node("scaler/Quality_bar/liquid")
	drink_hud = get_parent().get_parent()

func _process(delta: float) -> void:
	text.text = "%0.1f" % [timer.time_left]

func play() -> void:
	timer.start(10)
	ponteiro.stopped = false
	quality_liquid.stopped = false

func reduce_time() -> void:
	timer.wait_time = timer.time_left - 0.3
	timer.start()
	
func increase_time() -> void:
	timer.wait_time = timer.time_left+ 0.2
	timer.start()


func _on_timer_timeout() -> void:
	#### Lembre de reativar o ponteiro quando fizer a logica de abrir o minigame
	# Para o ponteiro da barra
	ponteiro.stopped = true
	# Para a barra de qualidade
	quality_liquid.stopped = true
	# Fecha a Hud
	drink_hud.deactive()
