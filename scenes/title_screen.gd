extends Control

@onready var menu_container: Container = $VBoxContainer/MarginContainer2/MenuContainer
@onready var start_menu: Control = $VBoxContainer/MarginContainer2/MenuContainer/StartMenu
@onready var games_menu: Control = $VBoxContainer/MarginContainer2/MenuContainer/TitleScreenGamesMenu

func _ready() -> void:
	Bgm.play_theme_title()
	hide_games_menu()
	show_start_menu()

func _on_button_start_pressed() -> void:
	hide_start_menu()
	show_games_menu()

func _on_title_screen_games_menu_canceled() -> void:
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

func show_games_menu() -> void:
	games_menu.show()
	games_menu.process_mode = Node.PROCESS_MODE_INHERIT
