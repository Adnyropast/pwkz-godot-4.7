extends Control

@onready var world_select_container: Container = $MarginContainer/WorldSelectScreen

func _ready() -> void:
	var worlds: Array[int] = WorldSelectOptions.get_next_worlds_options()
	world_select_container.set_worlds(worlds)
