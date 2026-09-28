extends Node

class_name MagiciteHealPlus

const MAGICITE = preload("res://resources/magicites/ma08.tres")

static func get_modified_healing(healing: int) -> int:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.heal_magicites.size()):
		var magicite: Magicite = PlayerMagicites.heal_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return floori(healing * (1 + count * 0.2))
