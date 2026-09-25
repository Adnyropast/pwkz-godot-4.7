extends Node

class_name MagiciteDrainPlus

const MAGICITE = preload("res://resources/magicites/ma02.tres")

static func has_magicites() -> bool:
	for i in range(0, PlayerMagicites.attack_magicites.size()):
		var magicite: Magicite = PlayerMagicites.attack_magicites[i]
		if magicite == MAGICITE:
			return true
	return false

static func get_drain_healing(damage: int) -> int:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.attack_magicites.size()):
		var magicite: Magicite = PlayerMagicites.attack_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return floori(damage * count * 0.2)
