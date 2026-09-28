extends Control

func _on_button_start_pressed() -> void:
	Inventory.reset_inventory()
	PlayerMagicites.reset_equipment()
	Worlds.move_to_first_world()
