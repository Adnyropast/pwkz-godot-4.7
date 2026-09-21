extends Control

@onready var world_select_container: Container = $VBoxContainer/WorldSelectScreen

func _ready() -> void:
	var worlds: Array[int] = WorldSelectOptions.get_retry_worlds_options()
	world_select_container.set_worlds(worlds)

func _on_button_cancel_pressed() -> void:
	queue_free()
	PopupInterfaces.open_defeat_popup()
