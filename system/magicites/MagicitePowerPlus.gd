extends Node

class_name MagicitePowerPlus

const MAGICITE = preload("res://resources/magicites/ma01.tres")

static func get_power_multiplier() -> float:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.attack_magicites.size()):
		var magicite: Magicite = PlayerMagicites.attack_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return 1 + count * 0.2
