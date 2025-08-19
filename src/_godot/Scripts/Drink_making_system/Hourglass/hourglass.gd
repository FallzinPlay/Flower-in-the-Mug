extends TextureRect


@onready var timer:= $Timer
@onready var text:= $Text

func _ready() -> void:
	timer.start(10)

func _process(delta: float) -> void:
	text.text = "%0.1f" % [timer.time_left]

func reduce_time() -> void:
	timer.wait_time = timer.time_left - 0.3
	timer.start()
	
func increase_time() -> void:
	timer.wait_time = timer.time_left+ 0.2
	timer.start()
