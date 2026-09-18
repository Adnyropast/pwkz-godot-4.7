extends Control

signal close_button_pressed

func _on_button_close_pressed() -> void:
	close_button_pressed.emit()
