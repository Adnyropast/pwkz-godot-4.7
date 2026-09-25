extends Control

@onready var world_label: Label = $PanelContainer/HBoxContainer/LabelWorld
@onready var stage_label: Label = $PanelContainer/HBoxContainer/LabelStage

func _ready() -> void:
	world_label.text = str(WorldState.current_world)
	stage_label.text = str(WorldState.current_stage)
	
	var tween: Tween = create_tween()
	tween.tween_callback(load_stage).set_delay(3.0)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		load_stage()

func load_stage() -> void:
	Scenes.go_to_battle_scene()
