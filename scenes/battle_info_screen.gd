extends Control

signal close_button_pressed
@onready var name_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/NameLabel

func _ready() -> void:
	name_label.text = Enemy.get_enemy_name()

func _on_button_close_pressed() -> void:
	close_button_pressed.emit()
