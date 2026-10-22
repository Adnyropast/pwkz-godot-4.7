extends Control

@onready var shape_texture_1: TextureRect = $PanelContainer/CenterContainer/HBoxContainer/BounceNode/ShapeTexture1
@onready var shape_texture_2: TextureRect = $PanelContainer/CenterContainer/HBoxContainer/BounceNode2/ShapeTexture2
@onready var shape_texture_3: TextureRect = $PanelContainer/CenterContainer/HBoxContainer/BounceNode3/ShapeTexture3
@onready var panel_container: PanelContainer = $PanelContainer
@onready var screen_button: Button = $ScreenButton

func _ready() -> void:
	panel_container.get_theme_stylebox("panel").set("bg_color", WorldColors.get_screen_color(WorldState.current_world))
	set_textures()
	Navigation.button_grab_focus(screen_button)
	var tween: Tween = create_tween()
	tween.tween_callback(load_phase).set_delay(1.5)

func _on_screen_button_pressed() -> void:
	load_phase()

func load_phase() -> void:
	if WorldState.prince_saved:
		Scenes.go_to_rescue_screen()
	else:
		Scenes.go_to_battle_scene()

func set_textures() -> void:
	shape_texture_1.texture = WorldState.get_world_shape_white()
	shape_texture_1.modulate = WorldColors.get_screen_shape_color(WorldState.current_world)
	shape_texture_2.texture = WorldState.get_world_shape_white()
	shape_texture_2.modulate = WorldColors.get_screen_shape_color(WorldState.current_world)
	shape_texture_3.texture = WorldState.get_world_shape_white()
	shape_texture_3.modulate = WorldColors.get_screen_shape_color(WorldState.current_world)
