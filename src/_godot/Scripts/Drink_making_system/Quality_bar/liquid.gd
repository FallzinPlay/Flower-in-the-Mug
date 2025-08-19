extends TextureRect

@onready var timer:= $Timer
var quality_bar: TextureRect = null

func _ready() -> void:
	timer.start(1)
	quality_bar = get_parent()

### ATENÇÃO!!! A barra está sendo somada no tamanho porque ela está rotacionada em 180 graus, ou seja, invertida no plano cartesiano. Isso foi necessário para o sistema funcionar.
# Sobe 5 pixel
func go_up() -> void:
	if size.y >= quality_bar.bar.size.y:
		return
	
	if size.y + 5 >= quality_bar.bar.size.y:
		size.y += quality_bar.bar.size.y - size.y
	else:
		size.y += 5

# Desce 1 pixel
func go_down() -> void:
	size.y -= 1

# A cada alarme desce pixels
func _on_timer_timeout() -> void:
	go_down()
