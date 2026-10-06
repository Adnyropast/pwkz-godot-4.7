extends Control

@onready var world_select_container: Container = $VBoxContainer/WorldSelectScreen
@onready var panel: Panel = $Panel

func _ready() -> void:
	panel.get_theme_stylebox("panel").set("bg_color", WorldColors.get_background_color(WorldState.current_world))
	var worlds: Array[int] = WorldSelectOptions.get_retry_worlds_options()
	world_select_container.set_worlds(worlds)

func _on_button_cancel_pressed() -> void:
	queue_free()
	PopupInterfaces.open_defeat_popup()
