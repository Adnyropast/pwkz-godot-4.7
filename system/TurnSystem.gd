extends Node

class_name TurnSystem

signal player_turn
signal enemy_turn
signal victory
var turn_pointer: bool = true

func start() -> void:
	start_pre_turn()

func end_turn() -> void:
	turn_pointer = !turn_pointer
	start_pre_turn()

func start_pre_turn() -> void:
	if VictorySystem.check_victory():
		victory.emit()
	else:
		start_turn()

func start_turn() -> void:
	if turn_pointer:
		player_turn.emit()
	else:
		enemy_turn.emit()
