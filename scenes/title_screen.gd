extends Control

@onready var menu_container: Container = $VBoxContainer/MarginContainer2/MenuContainer
@onready var start_menu: Control = $VBoxContainer/MarginContainer2/MenuContainer/StartMenu
@onready var games_menu: Control = $VBoxContainer/MarginContainer2/MenuContainer/TitleScreenGamesMenu
@onready var first_button: Button = $VBoxContainer/MarginContainer2/MenuContainer/StartMenu/VBoxContainer/ButtonStart
@onready var cancel_button: Button = $VBoxContainer/HBoxContainer/MarginContainer4/CancelButton

func _ready() -> void:
	Bgm.play_theme_title()
	hide_games_menu()
	show_start_menu()
	Navigation.set_first_button_visibility_changed(first_button)
	Navigation.button_grab_focus(first_button)

func _on_button_start_pressed() -> void:
	hide_start_menu()
	show_games_menu()

func _on_cancel_button_pressed() -> void:
	hide_games_menu()
	show_start_menu()

func hide_start_menu() -> void:
	start_menu.process_mode = Node.PROCESS_MODE_DISABLED
	start_menu.hide()

func show_start_menu() -> void:
	start_menu.show()
	start_menu.process_mode = Node.PROCESS_MODE_INHERIT

func hide_games_menu() -> void:
	games_menu.process_mode = Node.PROCESS_MODE_DISABLED
	games_menu.hide()
	cancel_button.hide()

func show_games_menu() -> void:
	cancel_button.show()
	games_menu.show()
	games_menu.process_mode = Node.PROCESS_MODE_INHERIT
