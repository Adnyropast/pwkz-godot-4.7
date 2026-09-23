extends Node

class_name Stages

static func next_stage() -> void:
	WorldState.current_phase = 0
	WorldState.current_stage += 1
	
	if WorldState.current_stage > WorldConstants.WORLD_STAGES_COUNT:
		WorldState.current_stage = 1
		WorldState.current_world += 1
		
		if WorldState.current_world > WorldConstants.WORLDS_COUNT:
			WorldState.current_world = 1
	
	Scenes.go_to_stage_start_screen()
	on_stage_start()

static func retry_stage() -> void:
	WorldState.current_phase = 0
	Scenes.go_to_stage_start_screen()
	on_stage_start()

static func on_stage_start() -> void:
	Player.reset_hp()
	WorldState.prince_saved = false
	Phases.on_phase_start()
