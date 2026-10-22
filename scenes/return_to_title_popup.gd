extends Control

signal cancel_button_pressed
@onready var first_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/ButtonCancel

func _ready() -> void:
	Navigation.button_grab_focus(first_button)

func _on_button_cancel_pressed() -> void:
	cancel_button_pressed.emit()

func _on_button_return_to_title_pressed() -> void:
	queue_free()
	Scenes.go_to_title_screen()
