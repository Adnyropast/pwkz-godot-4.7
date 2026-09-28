extends Node

var world_medals: Array[bool] = [false, false, false, false, false, false, false, false]

func set_medal(world: int) -> void:
	world_medals[world - 1] = true

func has_medal(world: int) -> bool:
	return world_medals[world - 1]

func reset_score() -> void:
	world_medals = [false, false, false, false, false, false, false, false]
