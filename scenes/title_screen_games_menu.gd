extends Control

@onready var settings_button: Button = $VBoxContainer/SettingsButton
@onready var first_button: Button = $VBoxContainer/GameButton1

func _ready() -> void:
	Navigation.set_first_button_visibility_changed(first_button)

func _on_game_button_1_pressed() -> void:
	pause()
	start_game(Players.Modes.MARIA)

func _on_game_button_2_pressed() -> void:
	pause()
	start_game(Players.Modes.LEONARDO)

func _on_settings_button_pressed() -> void:
	pause()
	PopupInterfaces.open_settings_popup(on_settings_closed)

func start_game(mode: Players.Modes) -> void:
	Bgm.stop_bgm()
	Player.player_mode = mode
	Scores.reset_score()
	DefeatsCounter.reset_defeats()
	Inventory.reset_inventory()
	PlayerMagicites.reset_equipment()
	PlayTimeTracker.reset()
	Worlds.move_to_first_world()

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func unpause() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT

func on_settings_closed() -> void:
	unpause()
	Navigation.button_grab_focus(settings_button)
