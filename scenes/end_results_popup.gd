extends Control

signal continue_button_pressed

func _on_button_continue_pressed() -> void:
	continue_button_pressed.emit()

func _on_button_quit_pressed() -> void:
	queue_free()
	Scenes.go_to_title_screen()
