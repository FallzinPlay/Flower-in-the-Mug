extends TextureRect

var bar: TextureRect = null
var bar_limiter_left: Marker2D = null
var bar_limiter_right: Marker2D = null

var good_area: TextureRect = null

func _ready() -> void:
	bar = $bar
	bar_limiter_left = $bar/limiter_left
	bar_limiter_right = $bar/limiter_right
	
	good_area = $good_area
