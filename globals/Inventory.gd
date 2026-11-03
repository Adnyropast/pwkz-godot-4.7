extends Node

var magicites: Dictionary[Magicite, int]

func get_magicite_count(magicite: Magicite) -> int:
	return magicites.get(magicite, 0)

func set_magicite_count(magicite: Magicite, count: int) -> void:
	if count > 99:
		magicites.set(magicite, 99)
	elif count <= 0:
		magicites.set(magicite, 0)
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
		var count: int = get_magicite_count(magicite)
		var type_match: bool = magicite.type == type or magicite.type == Magicite.MagiciteType.STATUS
		if type_match and count > 0:
			res.set(magicite, count)
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

func reset_inventory() -> void:
	magicites.clear()
	for i in range(0, MagicitesSorting.ORDER.size()):
		var magicite: Magicite = MagicitesSorting.ORDER[i]
		set_magicite_count(magicite, 0)

func get_total_magicites_count() -> int:
	var total: int = 0
	total += PlayerMagicites.attack_magicites.size()
	total += PlayerMagicites.defend_magicites.size()
	total += PlayerMagicites.heal_magicites.size()
	for i in range(0, magicites.size()):
		var count: int = magicites.values()[i]
		total += count
	return total
