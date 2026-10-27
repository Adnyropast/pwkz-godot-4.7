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

const CHANCE_WEIGHTS: Array[float] = [
	100,# Power +20%
	80,# Drain +20%
	50,# Instant K.O. +20%
	100,# Damage -12%
	90,# Turns +1
	70,# Endure +1 Turn
	90,# Reprisal +20%
	100,# Heal +20%
	70,# Revive +1 Turn
	80,# Attack +20%
	80,# Defense +20%
]

static func get_random_magicites(min_count: int, max_count: int) -> Dictionary[Magicite, int]:
	var rewards_count: int = randi_range(min_count, max_count)
	var res: Dictionary[Magicite, int]
	
	for i in range(0, rewards_count):
		var magicite: Magicite = get_weighted_random_magicite()
		var magicite_count: int = res.get(magicite, 0)
		res.set(magicite, magicite_count + 1)
	
	return res

static func add_and_get_random_magicites(min_count: int, max_count: int) -> Dictionary[Magicite, int]:
	var rewards: Dictionary[Magicite, int] = get_random_magicites(min_count, max_count)
	Inventory.add_magicites(rewards)
	return rewards

static func debug_max_magicites() -> void:
	var res: Dictionary[Magicite, int]
	for i in range(0, magicites.size()):
		var magicite: Magicite = magicites[i]
		res.set(magicite, 99)
	Inventory.add_magicites(res)

static func get_weighted_random_magicite() -> Magicite:
	var total: float = 0
	
	for i in range(0, CHANCE_WEIGHTS.size()):
		total += CHANCE_WEIGHTS[i]
	
	var value: float = randf_range(0, total)
	var cumulative_sum: float = 0
	
	for i in range(0, CHANCE_WEIGHTS.size()):
		cumulative_sum += CHANCE_WEIGHTS[i]
		
		if cumulative_sum > value:
			return magicites[i]
	
	return null
