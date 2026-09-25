extends Node

class_name DamageCalcs

static func get_modified_damage_to_player(damage: int) -> int:
	var multiplier: float = 1
	
	if Player.is_defending:
		multiplier *= MagiciteDamageMinus.get_modified_multiplier(0.6)
	
	return floori(damage * multiplier)

static func get_modified_damage_to_enemy(damage: int) -> int:
	var multiplier: float = 1
	
	if Enemy.is_defending:
		multiplier *= 0.6
	
	multiplier *= MagicitePowerPlus.get_power_multiplier()
	
	return floori(damage * multiplier)
