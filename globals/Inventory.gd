extends Node

var magicites: Dictionary[Magicite, int]

func get_magicite_count(magicite: Magicite) -> int:
	return magicites.get(magicite, 0)

func set_magicite_count(magicite: Magicite, count: int) -> void:
	if count > 99:
		magicites.set(magicite, 99)
	elif count <= 0:
		magicites.erase(magicite)
	else:
		magicites.set(magicite, count)

func add_magicites(plus_magicites: Dictionary[Magicite, int]) -> void:
	for i in range(0, plus_magicites.size()):
		var magicite: Magicite = plus_magicites.keys()[i]
		var previous_count: int = get_magicite_count(magicite)
		var new_count: int = previous_count + plus_magicites.get(magicite)
		set_magicite_count(magicite, new_count)

func filter_magicites(type: Magicite.MagiciteType) -> Dictionary[Magicite, int]:
	var res: Dictionary[Magicite, int]
	for i in range(0, magicites.size()):
		var magicite: Magicite = magicites.keys()[i]
		if magicite.type == type or magicite.type == Magicite.MagiciteType.STATUS:
			res.set(magicite, magicites.get(magicite))
	return res

func get_attack_magicites() -> Dictionary[Magicite, int]:
	return filter_magicites(Magicite.MagiciteType.ATTACK)

func get_defend_magicites() -> Dictionary[Magicite, int]:
	return filter_magicites(Magicite.MagiciteType.DEFEND)

func get_heal_magicites() -> Dictionary[Magicite, int]:
	return filter_magicites(Magicite.MagiciteType.HEAL)

func remove_magicite(magicite: Magicite) -> void:
	var count: int = get_magicite_count(magicite)
	if count > 0:
		set_magicite_count(magicite, count - 1)

func add_magicite(magicite: Magicite) -> void:
	set_magicite_count(magicite, get_magicite_count(magicite) + 1)
