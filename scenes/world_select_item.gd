extends Control

@onready var world_label: Label = $VBoxContainer/HBoxContainer/LabelWorld
signal select_button_pressed
var world: int

func _ready() -> void:
	world_label.text = str(world)

func _on_button_select_pressed() -> void:
	select_button_pressed.emit(world)

func set_world(p_world: int) -> void:
	world = p_world
