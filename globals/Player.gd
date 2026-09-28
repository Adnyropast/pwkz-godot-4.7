extends Node

const MAX_HP = 3000

signal player_defeated
signal hp_changed
signal statuses_changed
var hp: int
var defending_turns: int
var enduring_turns: int
var reprisal_turns: int

func reset_hp() -> void:
	set_hp(MAX_HP)

func set_hp(new_hp: int) -> void:
	if new_hp > MAX_HP:
		hp = MAX_HP
	elif new_hp < 0:
		hp = 0
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

func make_defend() -> void:
	defending_turns = MagiciteTurnsPlus.get_defending_turns()
	enduring_turns = MagiciteEndurePlus.get_enduring_turns()
	reprisal_turns = MagiciteReprisalPlus.get_reprisal_turns()
	statuses_changed.emit()

func on_turn_start() -> void:
	if defending_turns > 0:
		defending_turns -= 1
	if enduring_turns > 0:
		enduring_turns -= 1
	if reprisal_turns > 0:
		reprisal_turns -= 1
	statuses_changed.emit()

func is_defending() -> bool:
	return defending_turns > 0

func is_enduring() -> bool:
	return enduring_turns > 0

func has_reprisal() -> bool:
	return reprisal_turns > 0
