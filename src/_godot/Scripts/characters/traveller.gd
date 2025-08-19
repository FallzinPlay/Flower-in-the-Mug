class_name Traveller
extends CharacterBody2D


## A classe a seguir é apenas o protótipo para testes e vai ser isolada futuramente
class Drink:
	var drink_name: String = ""
	var recipe: String = ""
	
	func _init(_drink_name: String, _recipe: String) -> void:
		drink_name = _drink_name
		recipe = _recipe

#
#
#

const SPEED = 300.0

# Drink
var drink_list: Array = []
var drink_asked: Drink = null
var served: bool = false

func _ready() -> void:
	# Criando a lista de drinks
	drink_list = [Drink.new("A", "Abc"), Drink.new("B", "ABc")]

func _process(delta: float) -> void:
	# Se não tiver pedido nenhum drink
	if drink_asked == null:
		# Faz o pedido do drink
		drink_asked = _ask_drink()

func _physics_process(delta: float) -> void:
	_move()
	move_and_slide()


########## Movimentação ###########
# Faz o NPC se movimentar para as 8 direções
func _move() -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	direction = direction.normalized()

	velocity = direction * SPEED

#
## O script abaixo pode vir a ser desvinculado dessa classe
#

########## Pedindo uma bebida ##########
# Função principal que pede a bebida
func _ask_drink() -> Drink:
	var _drink = _choose_drink(drink_list)
	if _drink:
		_show_solicitation()
	return _drink
	
# Escolhe uma bebida
func _choose_drink(_drink_list: Array) -> Drink:
	return _drink_list[randi_range(0, _drink_list.size() - 1)]

# Mostra visualmente que o NPC tem um pedido
func _show_solicitation() -> void:
	print("%s está solicitando um pedido" % [name])


################ Recebendo o pedido #################
# Quando o mouse clica no NPC ele pega o pedido do mesmo
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("ML"):
		# Se o drink tiver valor e se o NPC não tiver sido servido ele define como servido
		if drink_asked != null:
			print("%s solicitou o drink %s" % [name, drink_asked.drink_name])
			if _make_drink(drink_asked):
				print("%s foi servido com sucesso" % [name])
				drink_asked = null


############### Fazendo o drink pedido ##########
# Abre o minigame de criação de bebidas
func _make_drink(_drink: Drink) -> bool:
	print("O drink %s está sendo feito" % [_drink.drink_name])
	
	# Lógica do minigame aqui
	#[ Ideia: ]
	# Criar uma classe para a hud do minigame e instanciar um objeto dela aqui nessa função.
	# Quando o minigame for completado, deletar a instancia.
	
	print("O drink %s foi feito" % [_drink.drink_name])
	return true
