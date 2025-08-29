extends StaticBody2D

func _on_collision_manager_body_entered(body: Node2D) -> void:
	if body is Traveller:
		body.get_out()
