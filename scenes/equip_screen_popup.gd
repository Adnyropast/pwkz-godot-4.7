extends Control

signal next_button_pressed

func _on_button_next_pressed() -> void:
	next_button_pressed.emit()
