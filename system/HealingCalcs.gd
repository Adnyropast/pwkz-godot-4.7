extends Node

class_name HealingCalcs

static func get_healing_roll_modified_healing(healing: int) -> int:
	var multiplier: float = randf_range(0.9, 1.1)
	healing = floori(healing * multiplier)
	return healing
