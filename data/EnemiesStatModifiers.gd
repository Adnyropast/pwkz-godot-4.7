extends Node

class_name EnemiesStatModifiers

const MODIFIERS: Array = [
	[-2, -1, -1],
	[0, 0, 1],
	[0, 1, -1],
	[0, 0, 0],
	[0, 1, 0],
	[2, 0, 0],
	[-1, -2, 0],
	[0, 2, 0],
	[1, 1, 0],
	[0, 0, -1],
	[1, 0, 0],
	[0, 1, -1],
	[1, 1, 0],
	[-1, 0, 0],
	[0, 0, 0],
	[0, 2, 0],
	[-1, 2, 0],
	[1, 0, 1],
	[1, 2, 0],
	[1, 1, 1],
]

static func convert_enemy_id(id: int) -> int:
	if id > 20:
		id = id - (21 - (12 + 1))
	
	return id - 1

static func get_enemy_max_hp(id: int) -> float:
	return MODIFIERS[convert_enemy_id(id)][0]

static func get_enemy_attack(id: int) -> float:
	return MODIFIERS[convert_enemy_id(id)][1]

static func get_enemy_defense(id: int) -> float:
	return MODIFIERS[convert_enemy_id(id)][2]
