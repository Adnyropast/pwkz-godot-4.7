extends Node

class_name Phases

static func next_phase() -> void:
	if WorldState.has_more_phases():
		WorldState.current_phase += 1
		Scenes.go_to_stage_inbetween_screen()
		on_phase_start()
	else:
		Stages.next_stage()

static func next_phase_rescue() -> void:
	WorldState.prince_saved = true
	Scenes.go_to_stage_inbetween_screen()

static func end_rescue() -> void:
	Scenes.go_to_world_select_screen()

static func on_phase_start() -> void:
	Enemy.reset_hp()
