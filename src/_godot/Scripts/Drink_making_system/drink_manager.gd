extends Node2D
class_name DrinkManager

## Fazendo a detecção de clique em cima do viajante

# Recebe o viajante clicado quando o evento acontecer
func _on_traveller_clicked(traveller: Traveller) -> void:
	print("%s foi clicado." % [traveller.name])
	if traveller.drink_ordered:
		_make_drink(traveller.drink_ordered)
		traveller.take_the_drink(traveller.drink_ordered)

# Abre o minigame de criação de bebidas
func _make_drink(_drink: Drink) -> bool:
	print("O drink %s está sendo feito" % [_drink])
	
	# Abre a hud do minigame
	#get_node("/root/Old_Mammoth_Tavern/Hud/Drink_hud").activate()
	
	print("O drink %s foi feito" % [_drink])
	return true
