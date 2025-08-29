extends Node2D
class_name SeatManager

var seats := [Marker2D]
var free_seats := [Marker2D]

func _ready() -> void:
	# Pega todos os assentos
	seats = get_children()
	free_seats = seats # Deixa todos os assentos livres

# Verifica se o assento está livre
func _can_occupy_that_seat(seat: Marker2D) -> bool:
	if not free_seats.has(seat):
		return false
	return true

# Retorna a lista de assentos livres
func get_free_seat_list() -> Array:
	return free_seats

# Pega um assento livre
func get_free_seat() -> Marker2D:
	for s in seats:
		if _can_occupy_that_seat(s):
			return s
	return null

# Ocupa um assento
func occupy_seat(seat: Marker2D) -> void:
	if not free_seats.has(seat):
		return
	free_seats.erase(seat)
	
# Desocupa um assento
func empty_seat(seat: Marker2D) -> void:
	if free_seats.has(seat):
		return
	free_seats.append(seat)
