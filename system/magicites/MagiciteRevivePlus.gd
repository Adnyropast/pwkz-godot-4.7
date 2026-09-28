extends Node

class_name MagiciteRevivePlus

const MAGICITE = preload("res://resources/magicites/ma09.tres")

static func get_revive_turns() -> int:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.heal_magicites.size()):
		var magicite: Magicite = PlayerMagicites.heal_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return count
