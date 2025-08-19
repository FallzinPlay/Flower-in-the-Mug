extends TextureRect

var bar: TextureRect = null
var bar_limiter_bottom: Marker2D = null
var bar_limiter_top: Marker2D = null

func _ready() -> void:
	bar = $bar
	bar_limiter_bottom = $bar/limiter_bottom
	bar_limiter_top = $bar/limiter_top
