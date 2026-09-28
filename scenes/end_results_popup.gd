extends Control

signal continue_button_pressed
@onready var medals_container: Container = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/MedalsContainer

func _ready() -> void:
	set_worlds_medals()

func _on_button_continue_pressed() -> void:
	continue_button_pressed.emit()

func _on_button_quit_pressed() -> void:
	queue_free()
	Scenes.go_to_title_screen()

func set_worlds_medals() -> void:
	for i in range(0, WorldConstants.WORLDS_COUNT):
		var world: int = i + 1
		if Scores.has_medal(world):
			medals_container.get_child(i).texture = WorldConstants.get_world_texture(world)
		else:
			medals_container.get_child(i).texture = null
