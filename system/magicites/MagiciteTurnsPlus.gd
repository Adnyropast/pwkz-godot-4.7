extends Node

class_name MagiciteTurnsPlus

const MAGICITE = preload("res://resources/magicites/ma05.tres")

static func get_defending_turns() -> int:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.defend_magicites.size()):
		var magicite: Magicite = PlayerMagicites.defend_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return 1 + count
