extends Control

@onready var shape_texture_1: TextureRect = $PanelContainer/CenterContainer/HBoxContainer/BounceNode/ShapeTexture1
@onready var shape_texture_2: TextureRect = $PanelContainer/CenterContainer/HBoxContainer/BounceNode2/ShapeTexture2
@onready var shape_texture_3: TextureRect = $PanelContainer/CenterContainer/HBoxContainer/BounceNode3/ShapeTexture3

func _ready() -> void:
	set_textures()
	var tween: Tween = create_tween()
	tween.tween_callback(load_phase).set_delay(1.5)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		load_phase()

func load_phase() -> void:
	if WorldState.prince_saved:
		Scenes.go_to_rescue_screen()
	else:
		Scenes.go_to_battle_scene()

func set_textures() -> void:
	shape_texture_1.texture = WorldState.get_world_shape()
	shape_texture_2.texture = WorldState.get_world_shape()
	shape_texture_3.texture = WorldState.get_world_shape()
