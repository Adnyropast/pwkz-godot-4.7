extends Node

class_name TurnSystem

signal player_turn
signal enemy_turn
var turn_pointer: bool = true

func end_turn() -> void:
	turn_pointer = !turn_pointer
	start_turn()

func start_turn() -> void:
	if turn_pointer:
		player_turn.emit()
	else:
		enemy_turn.emit()
