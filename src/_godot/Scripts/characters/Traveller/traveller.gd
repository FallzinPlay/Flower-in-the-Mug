class_name Traveller
extends CharacterBody2D

const SPEED = 100

# Estados
enum States {
	IDLE, MOVING, ORDERING, SITTING, DRINKING
}
var current_state: States = States.IDLE
var is_served: bool = false
var is_drink_finished: bool = false
var wants_another_drink: bool = true

# Localização
enum Places {
	TAVERN
}
var current_place: Places = Places.TAVERN

# Drink
var drink_ordered: Drink = null

# Pré carregados
@onready var path_agent := $Navigator # A*
@onready var timer := $Timer


############ Ciclo Principal ###########
func _process(delta: float) -> void:
	# Se não estiver na taverna não executa o código
	if current_place != Places.TAVERN:
		return

	# gerenciador de estados
	match current_state:
		# Estado ocioso
		States.IDLE:
			# Se quiser beber mais
			if wants_another_drink:
				# Se não tiver servido ou pedido uma bebida, ir até o bar
				if not is_served and not drink_ordered:
					_move_to_bar()
				# Se estiver servido ir para a mesa
				elif is_served:
					_move_to_table()
			# Se não quiser mais beber
			else:
				# Vai embora
				_move_to_door()
		
		# Estado de movimento
		States.MOVING:
			# Se tiver chegado ao destino parar
			if path_agent.is_navigation_finished():
				velocity = Vector2.ZERO
				_on_arrival()
		
		# Estado de solicitação
		States.ORDERING:
			# Pedir uma bebida
			_request_drink()
		
		# Estado de sentado
		States.SITTING:
			# Pode ter lógica de esperar X segundos antes de beber
			# ...
			
			var _min_drink_time: float = 10
			var _max_drink_time: float = 30
			# Começa a beber
			print("%s está bebendo 🍺" % name)
			timer.start(randf_range(_min_drink_time, _max_drink_time))
			current_state = States.DRINKING
		
		# Estado de bebendo
		States.DRINKING:
			# Beber
			_drink()

# Função para a fisica
func _physics_process(delta: float) -> void:
	# Se estiver se movendo atualizar as configurações de movimento
	if current_state == States.MOVING:
		_update_movement()
	move_and_slide()


############ Movimento ###########
# Atualiza as configurações de movimento
func _update_movement() -> void:
	# Proximo destino
	var next_point = path_agent.get_next_path_position()
	var direction = (next_point - global_position).normalized()
	velocity = direction * SPEED

# Define qual o proximo destino
func go_to(target: Vector2) -> void:
	if path_agent.target_position == target:
		return
	path_agent.target_position = target
	current_state = States.MOVING


############ Escolha da proxima ação ##############
func _choose_next_action() -> void:
	# Escolhe se quer beber de novo ou ir embora
	var _choose := randi_range(0, 1)
	if _choose <= 0:
		wants_another_drink = true
	else:
		wants_another_drink = false


############ Bar ###########
# Pega o nó do bar
func _find_the_bar() -> StaticBody2D:
	return get_tree().get_first_node_in_group("Bar")

# Vai até o bar
func _move_to_bar() -> void:
	var pos = _find_the_bar().global_position + Vector2(0, 50) # Ajuste temporario da posição
	go_to(pos)

# Faz o pedido da bebida
func _request_drink() -> void:
	# Se já tiver pedido, retornar
	if drink_ordered:
		return
	drink_ordered = Drink.new()
	print("%s pediu um drink" % name)
	current_state = States.IDLE

# Recebe a bibida
func take_the_drink(drink: Drink) -> void:
	print("%s foi servido com sucesso" % name)
	drink_ordered = null
	is_served = true
	current_state = States.IDLE


############ Mesas ###########
# Escolhe uma mesa
func _choose_table() -> StaticBody2D:
	var _tables = get_tree().get_nodes_in_group("Tables")
	return _tables[randi_range(0, _tables.size() - 1)]

# Vai até a mesa escolhida
func _move_to_table() -> void:
	var _table = _choose_table()
	var _pos = _table.global_position + Vector2(50, 50)
	go_to(_pos)

# Senta-se
func _sit_down() -> void:
	print("%s sentou" % name)
	current_state = States.SITTING

# Toma a bebida
func _drink() -> void:
	# Termina de beber
	if is_drink_finished:
		is_drink_finished = false
		is_served = false
		print("%s terminou a bebida 🥛" % name)
		
		_choose_next_action()
		current_state = States.IDLE


############ Partida ###########
func _find_the_door() -> StaticBody2D:
	var _exit_door: StaticBody2D = null
	var _doors := get_tree().get_nodes_in_group("Doors")
	for d in _doors:
		if d.name == "ExitDoor":
			_exit_door = d
	
	if not _exit_door:
		print("%s não conseguiu achar a porta de saída. \nPorta de saída = %s" % [name, _exit_door])
	return _exit_door

func _move_to_door() -> void:
	var pos = _find_the_door().global_position
	go_to(pos)

func get_out() -> void:
	# Se ainda quiser beber, retornar
	if wants_another_drink:
		print("%s: Não vou sair. Ainda quero beber! 🥂" % [name])
		return
	
	print("%s: Acho que já vou embora..." % [name])
	queue_free()
	# Lógica para sair da taverna


############ Controle de Chegada ###########
# Quando chegar ao destindo
func _on_arrival() -> void:
	if wants_another_drink:
		# Se não estiver servido nem tiver pedido uma bebida, estar no estado de solicitação
		if not is_served and not drink_ordered:
			current_state = States.ORDERING
		# Se estiver servido, ir sentar
		elif is_served:
			_sit_down()


########## Timer ###########
func _on_timer_timeout() -> void:
	if not is_drink_finished:
		is_drink_finished = true
