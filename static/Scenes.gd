extends Node

class_name Scenes

static func go_to_stage_scene() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	tree.change_scene_to_file("res://scenes/stage.tscn")

static func go_to_stage_start_screen() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	tree.change_scene_to_file("res://scenes/stage_start_screen.tscn")

static func go_to_stage_inbetween_screen() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	tree.change_scene_to_file("res://scenes/stage_inbetween_screen.tscn")
