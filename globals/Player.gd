extends Node

const MAX_HP = 3000

signal player_defeated
signal hp_changed
var hp: int

func reset_hp() -> void:
	set_hp(MAX_HP)

func set_hp(new_hp: int) -> void:
	if new_hp > MAX_HP:
		hp = MAX_HP
	else:
		hp = new_hp
	hp_changed.emit()

func subtract_hp(value_hp: int) -> void:
	set_hp(hp - value_hp)

func add_hp(value_hp) -> void:
	set_hp(hp + value_hp)

func is_ko() -> int:
	return hp <= 0

func try_emit_player_defeated() -> void:
	if is_ko():
		player_defeated.emit()
