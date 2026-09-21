extends Control

func _on_button_retry_pressed() -> void:
	queue_free()
	PopupInterfaces.open_equip_screen_popup(WorldState.retry_stage)

func _on_button_world_select_pressed() -> void:
	queue_free()
	Scenes.go_to_world_select_retry_screen()

func _on_button_title_screen_pressed() -> void:
	queue_free()
	Scenes.go_to_title_screen()
