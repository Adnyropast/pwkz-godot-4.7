extends Node

class_name MagiciteInstantKOPlus

const MAGICITE = preload("res://resources/magicites/ma03.tres")

static func roll_instant_ko() -> bool:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.attack_magicites.size()):
		var magicite: Magicite = PlayerMagicites.attack_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	var instant_ko_chance: int = count * 20
	
	return randi_range(0, 99) < instant_ko_chance
