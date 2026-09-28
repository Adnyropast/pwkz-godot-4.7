extends Control

signal canceled

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		canceled.emit()

func _on_game_button_1_pressed() -> void:
	start_game(Players.Modes.MARIA)

func _on_game_button_2_pressed() -> void:
	start_game(Players.Modes.LEONARDO)

func start_game(mode: Players.Modes) -> void:
	Player.player_mode = mode
	Scores.reset_score()
	Inventory.reset_inventory()
	PlayerMagicites.reset_equipment()
	Worlds.move_to_first_world()
