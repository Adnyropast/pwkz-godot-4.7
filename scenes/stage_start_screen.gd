extends Control

func _ready() -> void:
	$PanelContainer/HBoxContainer/LabelWorld.text = str(Worlds.current_world)
	$PanelContainer/HBoxContainer/LabelStage.text = str(Worlds.current_stage)
	
	var tween: Tween = create_tween()
	tween.tween_callback(loadStage).set_delay(3.0)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		loadStage()

func loadStage() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	tree.change_scene_to_file("res://scenes/stage.tscn")
