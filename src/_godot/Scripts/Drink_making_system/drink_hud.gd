extends Panel

func activate() -> void:
	visible = true
	get_node("scaler/Hourglass").play()
	
func deactive() -> void:
	visible = false
