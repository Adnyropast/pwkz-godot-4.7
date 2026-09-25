extends Control

signal next_button_pressed

@onready var magicites_container: Container = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/MagicitesContainer

func _ready() -> void:
	var magicites: Dictionary[Magicite, int] = RewardSystem.add_and_get_random_magicites()
	set_magicite_items(magicites)

func _on_button_next_pressed() -> void:
	next_button_pressed.emit()

func set_magicite_items(magicites: Dictionary[Magicite, int]) -> void:
	for i in range(0, magicites.size()):
		var magicite: Magicite = magicites.keys()[i]
		var quantity: int = magicites.get(magicite)
		var item: Node = preload("res://scenes/rewards_magicite_item.tscn").instantiate()
		magicites_container.add_child(item)
		item.set_magicite_texture(magicite.get_texture())
		item.set_magicite_name(magicite.name)
		item.set_quantity(quantity)
