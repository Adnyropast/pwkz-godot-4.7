extends Control

@onready var debug_button: Button = $VBoxContainer/DebugButton
@onready var first_button: Button = $VBoxContainer/GameButton1

func _ready() -> void:
	refresh_debug_button()
	Navigation.set_first_button_visibility_changed(first_button)

func _on_game_button_1_pressed() -> void:
	pause()
	start_game(Players.Modes.MARIA)

func _on_game_button_2_pressed() -> void:
	pause()
	start_game(Players.Modes.LEONARDO)

func _on_debug_button_pressed() -> void:
	Debug.toggle_debug_on()
	refresh_debug_button()

func start_game(mode: Players.Modes) -> void:
	Bgm.stop_bgm()
	Player.player_mode = mode
	Scores.reset_score()
	Inventory.reset_inventory()
	PlayerMagicites.reset_equipment()
	Worlds.move_to_first_world()

func refresh_debug_button() -> void:
	if Debug.is_debug_on():
		debug_button.text = "Debug: On"
	else:
		debug_button.text = "Debug: Off"

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
