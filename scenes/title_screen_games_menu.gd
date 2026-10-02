extends Control

signal canceled
@onready var debug_button: Button = $VBoxContainer/DebugButton

func _ready() -> void:
	refresh_debug_button()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		canceled.emit()

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
