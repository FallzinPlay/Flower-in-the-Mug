extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Traveller:
		if body.current_place != body.Places.TAVERN:
			body.current_place = body.Places.TAVERN
