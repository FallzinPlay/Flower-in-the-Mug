extends Area2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# Chama todos os nós do grupo 'Systems' e ativa o método '_on_traveller_clicked' enviando o viajante como atributo
			get_tree().call_group("Systems", "_on_traveller_clicked", get_parent())
