extends Node

var current_world: int = 1
var current_stage: int = 1
var current_phase: int = 0
var prince_saved: bool

func next_stage() -> void:
	prince_saved = false
	current_phase = 0
	current_stage += 1
	
	if current_stage > WorldConstants.WORLD_STAGES_COUNT:
		current_world += 1
		current_stage = 1
		
		if current_world > WorldConstants.WORLDS_COUNT:
			current_world = 1
			current_stage = 1
	
	Scenes.go_to_stage_start_screen()

func get_phases_count() -> int:
	return WorldConstants.get_phases_count(current_world, current_stage)

func has_more_phases() -> bool:
	return current_phase < get_phases_count() - 1

func next_phase() -> void:
	if has_more_phases():
		current_phase += 1
		Scenes.go_to_stage_inbetween_screen()
	else:
		next_stage()

func is_final_stage() -> bool:
	return current_stage == WorldConstants.WORLD_STAGES_COUNT

func next_phase_rescue() -> void:
	prince_saved = true
	Scenes.go_to_stage_inbetween_screen()

func end_rescue() -> void:
	next_stage()
