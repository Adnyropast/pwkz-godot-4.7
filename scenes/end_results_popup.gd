extends Control

signal continue_button_pressed

func _on_button_continue_pressed() -> void:
	continue_button_pressed.emit()
