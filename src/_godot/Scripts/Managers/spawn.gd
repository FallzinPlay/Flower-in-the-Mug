extends Marker2D

var max_npcs: int = 1
var current_npcs: int = 0
var npc_scene := preload("res://Scenes/Characters/traveller.tscn")
@onready var timer := $Timer # Tempo até spawnar o proximo

func npc_instantiate(scene) -> void:
	var inst = scene.instantiate()
	get_node("/root/Old_Mammoth_Tavern/Map/Characters").add_child(inst)
	inst.global_position = global_position
	print("%s entrou na taverna" % [inst.name])

# Pronto pra spawnar
func _on_timer_timeout() -> void:
	if current_npcs < max_npcs:
		npc_instantiate(npc_scene)
		current_npcs += 1
