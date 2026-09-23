extends Node

signal player_defeated
var hp: int

func reset_hp() -> void:
	hp = 3000

func set_hp(new_hp: int) -> void:
	hp = new_hp

func subtract_hp(value_hp: int) -> void:
	set_hp(hp - value_hp)

func is_ko() -> int:
	return hp <= 0

func try_emit_player_defeated() -> void:
	if is_ko():
		player_defeated.emit()
