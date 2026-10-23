extends Node

class_name EnemyBaseStats

static func get_base_max_hp() -> float:
	return get_progression_value(2000, 4500)

static func get_base_attack() -> float:
	return get_progression_value(1800, 2200)

static func get_base_defense() -> float:
	return get_progression_value(400, 600)

static func get_progression() -> float:
	var world_value: float = WorldState.current_world - 1
	var stage_value: float = WorldState.current_stage - 1
	var final_value: int = WorldConstants.WORLDS_COUNT * WorldConstants.WORLD_STAGES_COUNT - 1
	var current_value: float = world_value * WorldConstants.WORLD_STAGES_COUNT + stage_value
	var progression: float = current_value / final_value
	return progression

static func get_progression_value(min_value: float, max_value: float) -> float:
	return min_value + get_progression() * (max_value - min_value)
