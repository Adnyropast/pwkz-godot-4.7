extends Node

class_name MagiciteDamageMinus

const MAGICITE = preload("res://resources/magicites/ma04.tres")

static func get_modified_multiplier(multiplier: float) -> float:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.defend_magicites.size()):
		var magicite: Magicite = PlayerMagicites.defend_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return multiplier - count * 0.12
