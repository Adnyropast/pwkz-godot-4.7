extends Node

var current_world: int = 1
var current_stage: int = 1
var current_phase: int = 0
var prince_saved: bool

func get_phases_count() -> int:
	return WorldConstants.get_phases_count(current_world, current_stage)

func has_more_phases() -> bool:
	return current_phase < get_phases_count() - 1

func is_final_stage() -> bool:
	return current_stage == WorldConstants.WORLD_STAGES_COUNT

func is_final_world() -> bool:
	return current_world == WorldConstants.WORLDS_COUNT
