extends Control

func _on_button_start_pressed() -> void:
	Scores.reset_score()
	Inventory.reset_inventory()
	PlayerMagicites.reset_equipment()
	Worlds.move_to_first_world()
