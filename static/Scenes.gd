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

static func go_to_rescue_screen() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	tree.change_scene_to_file("res://scenes/rescue_screen.tscn")

static func go_to_world_select_screen() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	tree.change_scene_to_file("res://scenes/world_select_screen.tscn")

static func go_to_title_screen() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	tree.change_scene_to_file("res://scenes/title_screen.tscn")
