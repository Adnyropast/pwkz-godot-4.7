extends Node

class_name Worlds

static func move_to_world(world: int) -> void:
	WorldState.current_world = world
	WorldState.current_stage = 1
	WorldState.current_phase = 0
	Scenes.go_to_stage_start_screen()
	Stages.on_stage_start()

static func move_to_first_world() -> void:
	move_to_world(1)
