extends Control

signal continue_button_pressed
@onready var medals_container: Container = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/MedalsContainer
@onready var player_name_label: Label = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/PlayerNameLabel
@onready var date_time_label: Label = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/DateTimeLabel
@onready var play_time_label: Label = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer3/PlayTimeLabel
@onready var defeats_label: Label = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer4/DefeatsLabel
@onready var first_button: Button = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/ButtonContinue

func _ready() -> void:
	set_worlds_medals()
	set_player_name()
	set_date_time()
	set_play_time()
	set_defeats()
	Navigation.button_grab_focus(first_button)

func _on_button_continue_pressed() -> void:
	continue_button_pressed.emit()

func _on_button_quit_pressed() -> void:
	queue_free()
	Scenes.go_to_title_screen()

func set_worlds_medals() -> void:
	for i in range(0, WorldConstants.WORLDS_COUNT):
		var world: int = i + 1
		if Scores.has_medal(world):
			medals_container.get_child(i).texture = WorldConstants.get_world_texture(world)
		else:
			medals_container.get_child(i).texture = null

func set_player_name() -> void:
	player_name_label.text = Player.get_player_name()

func set_date_time() -> void:
	date_time_label.text = DateTimeStrings.get_current_date_time()

func set_play_time() -> void:
	play_time_label.text = DateTimeStrings.time_ms_to_time_string(PlayTimeTracker.time_ms)

func set_defeats() -> void:
	defeats_label.text = str(DefeatsCounter.defeats_count)
