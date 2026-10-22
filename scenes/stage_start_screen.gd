extends Control

@onready var world_label: Label = $PanelContainer/HBoxContainer/LabelWorld
@onready var stage_label: Label = $PanelContainer/HBoxContainer/LabelStage
@onready var panel_container: PanelContainer = $PanelContainer
@onready var screen_button: Button = $ScreenButton

func _ready() -> void:
	panel_container.get_theme_stylebox("panel").set("bg_color", WorldColors.get_screen_color(WorldState.current_world))
	world_label.text = str(WorldState.current_world)
	stage_label.text = str(WorldState.current_stage)
	Navigation.button_grab_focus(screen_button)
	var tween: Tween = create_tween()
	tween.tween_callback(load_stage).set_delay(3.0)

func _on_screen_button_pressed() -> void:
	load_stage()

func load_stage() -> void:
	Scenes.go_to_battle_scene()
