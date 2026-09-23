extends Node

class_name TurnSystem

signal player_turn
signal enemy_turn
signal victory
signal defeat
var turn_pointer: bool = false

func start() -> void:
	start_pre_turn()

func end_turn() -> void:
	start_pre_turn()

func start_pre_turn() -> void:
	if DefeatSystem.check_defeat():
		defeat.emit()
	elif VictorySystem.check_victory():
		victory.emit()
	else:
		pick_character()
		start_turn()

func pick_character() -> void:
	turn_pointer = !turn_pointer

func start_turn() -> void:
	if turn_pointer:
		player_turn.emit()
	else:
		enemy_turn.emit()
