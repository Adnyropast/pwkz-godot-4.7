extends Node

class_name MagiciteEndurePlus

const MAGICITE = preload("res://resources/magicites/ma06.tres")

static func get_enduring_turns() -> int:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.defend_magicites.size()):
		var magicite: Magicite = PlayerMagicites.defend_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return count
