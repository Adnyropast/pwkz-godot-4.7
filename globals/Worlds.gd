extends Node

const WORLDS_COUNT: int = 8
const WORLD_STAGES_COUNT: int = 4
var current_world: int = 1
var current_stage: int = 1

func next_stage() -> void:
	current_stage += 1
	
	if current_stage > WORLD_STAGES_COUNT:
		current_world += 1
		current_stage = 1
		
		if current_world > WORLDS_COUNT:
			current_world = 1
			current_stage = 1
	
	var tree: SceneTree = Engine.get_main_loop()
	tree.change_scene_to_file("res://scenes/stage_start_screen.tscn")
