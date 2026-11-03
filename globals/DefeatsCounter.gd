extends Node

var defeats_count: int

func reset_defeats() -> void:
	defeats_count = 0

func increase_defeats() -> void:
	defeats_count += 1
