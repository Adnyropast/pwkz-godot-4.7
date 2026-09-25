extends Node

var magicites: Dictionary[Magicite, int]

func get_magicite_count(magicite: Magicite) -> int:
	return magicites.get(magicite, 0)

func set_magicite_count(magicite: Magicite, count: int) -> void:
	if count > 99:
		magicites.set(magicite, 99)
	else:
		magicites.set(magicite, count)

func add_magicites(plus_magicites: Dictionary[Magicite, int]) -> void:
	for i in range(0, plus_magicites.size()):
		var magicite: Magicite = plus_magicites.keys()[i]
		var previous_count: int = get_magicite_count(magicite)
		var new_count: int = previous_count + plus_magicites.get(magicite)
		set_magicite_count(magicite, new_count)
