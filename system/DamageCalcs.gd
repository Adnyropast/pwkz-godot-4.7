extends Node

class_name DamageCalcs

static func get_modified_damage_to_player(damage: int) -> int:
	var multiplier: float = 1
	
	if Player.is_defending():
		multiplier *= MagiciteDamageMinus.get_modified_multiplier(0.6)
	
	damage = floori(damage * multiplier)
	
	if Player.is_enduring() and Player.hp - damage <= 0:
		damage = Player.hp - 1
	
	return damage

static func get_modified_damage_to_enemy(damage: int) -> int:
	var multiplier: float = 1
	
	if Enemy.is_defending:
		multiplier *= 0.6
	
	if Enemy.has_absorb_barrier:
		multiplier *= -0.5
	
	multiplier *= MagicitePowerPlus.get_power_multiplier()
	
	return floori(damage * multiplier)

static func get_base_damage_to_player() -> int:
	var damage: int = Enemy.get_stat_attack() - Player.get_stat_defense()
	if damage < 0:
		damage = 0
	return damage

static func get_reprisal_drain_to_player(damage: int) -> int:
	var value: int = 0
	
	if Enemy.has_reflect_barrier:
		var reflect_damage: int = floori(damage * 0.5)
		value += reflect_damage
	
	if MagiciteDrainPlus.has_magicites():
		var healing: int = MagiciteDrainPlus.get_drain_healing(damage)
		healing = absi(healing)
		value -= healing
	
	return value
