extends Node

class_name EnemyStatModifiers

static func get_modifier_max_hp() -> float:
	return 1.2 + EnemiesStatModifiers.get_enemy_max_hp(Enemy.get_id()) * 0.1

static func get_modifier_attack() -> float:
	return 1.2 + EnemiesStatModifiers.get_enemy_attack(Enemy.get_id()) * 0.1

static func get_modifier_defense() -> float:
	return 1.2 + EnemiesStatModifiers.get_enemy_defense(Enemy.get_id()) * 0.1
