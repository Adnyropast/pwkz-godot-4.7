extends Node

class_name DamageCalcs

static func get_modified_damage_to_player(damage: int) -> int:
	if Player.is_defending:
		damage = floori(damage * 0.6)
	return damage
