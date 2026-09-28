extends Node

class_name MagiciteReprisalPlus

const MAGICITE = preload("res://resources/magicites/ma07.tres")

static func get_reprisal_turns() -> int:
	for i in range(0, PlayerMagicites.defend_magicites.size()):
		var magicite: Magicite = PlayerMagicites.defend_magicites[i]
		if magicite == MAGICITE:
			return 1
	return 0

static func get_reprisal_damage(damage: int) -> int:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.defend_magicites.size()):
		var magicite: Magicite = PlayerMagicites.defend_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return floori(damage * count * 0.2)
