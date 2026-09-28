extends Node

class_name MagiciteDefensePlus

const MAGICITE = preload("res://resources/magicites/ma11.tres")

static func get_buff_turns_from_attack() -> int:
	for i in range(0, PlayerMagicites.attack_magicites.size()):
		var magicite: Magicite = PlayerMagicites.attack_magicites[i]
		if magicite == MAGICITE:
			return 2
	return 0

static func get_buff_turns_from_defend() -> int:
	for i in range(0, PlayerMagicites.defend_magicites.size()):
		var magicite: Magicite = PlayerMagicites.defend_magicites[i]
		if magicite == MAGICITE:
			return 2
	return 0

static func get_buff_turns_from_heal() -> int:
	for i in range(0, PlayerMagicites.heal_magicites.size()):
		var magicite: Magicite = PlayerMagicites.heal_magicites[i]
		if magicite == MAGICITE:
			return 2
	return 0

static func get_buff_value_from_attack() -> float:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.attack_magicites.size()):
		var magicite: Magicite = PlayerMagicites.attack_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return count * 0.2

static func get_buff_value_from_defend() -> float:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.defend_magicites.size()):
		var magicite: Magicite = PlayerMagicites.defend_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return count * 0.2

static func get_buff_value_from_heal() -> float:
	var count: int = 0
	
	for i in range(0, PlayerMagicites.heal_magicites.size()):
		var magicite: Magicite = PlayerMagicites.heal_magicites[i]
		if magicite == MAGICITE:
			count += 1
	
	return count * 0.2
