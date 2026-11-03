extends Control

signal closed
@onready var debug_button: Button = $MarginContainer/VBoxContainer/DebugButton
@onready var first_button: Button = $MarginContainer/VBoxContainer/DebugButton

func _ready() -> void:
	refresh_debug_button()
	Navigation.button_grab_focus(first_button)

func _on_debug_button_pressed() -> void:
	Debug.toggle_debug_on()
	refresh_debug_button()

func _on_close_button_pressed() -> void:
	closed.emit()

func refresh_debug_button() -> void:
	if Debug.is_debug_on():
		debug_button.text = "Debug: On"
	else:
		debug_button.text = "Debug: Off"
