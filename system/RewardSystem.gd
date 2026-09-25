extends Node

class_name RewardSystem

const magicites: Array[Magicite] = [
	preload("res://resources/magicites/ma01.tres"),
	preload("res://resources/magicites/ma02.tres"),
	preload("res://resources/magicites/ma03.tres"),
	preload("res://resources/magicites/ma04.tres"),
	preload("res://resources/magicites/ma05.tres"),
	preload("res://resources/magicites/ma06.tres"),
	preload("res://resources/magicites/ma07.tres"),
	preload("res://resources/magicites/ma08.tres"),
	preload("res://resources/magicites/ma09.tres"),
	preload("res://resources/magicites/ma10.tres"),
	preload("res://resources/magicites/ma11.tres"),
]

static func get_random_magicites() -> Dictionary[Magicite, int]:
	var rewards_count: int = randi_range(1, 3)
	var res: Dictionary[Magicite, int]
	
	for i in range(0, rewards_count):
		var magicite: Magicite = magicites[randi_range(0, magicites.size() - 1)]
		var magicite_count: int = res.get(magicite, 0)
		res.set(magicite, magicite_count + 1)
	
	return res

static func add_and_get_random_magicites() -> Dictionary[Magicite, int]:
	var rewards: Dictionary[Magicite, int] = get_random_magicites()
	Inventory.add_magicites(rewards)
	return rewards

static func debug_max_magicites() -> void:
	var res: Dictionary[Magicite, int]
	for i in range(0, magicites.size()):
		var magicite: Magicite = magicites[i]
		res.set(magicite, 99)
	Inventory.add_magicites(res)
