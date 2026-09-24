extends Control

signal close_button_pressed
@onready var name_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/NameLabel
@onready var hp_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/HPLabel
@onready var max_hp_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/MaxHPLabel
@onready var hp_bar: ProgressBar = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/VBoxContainer/HPBar
@onready var statuses_container: Container = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/StatusesContainer

func _ready() -> void:
	name_label.text = Enemy.get_enemy_name()
	max_hp_label.text = str(Enemy.get_max_hp())
	hp_label.text = str(Enemy.hp)
	hp_bar.max_value = Enemy.get_max_hp()
	hp_bar.value = Enemy.hp
	update_statuses()

func _on_button_close_pressed() -> void:
	close_button_pressed.emit()

func update_statuses() -> void:
	if Enemy.is_defending:
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Defend")
		item.set_texture(preload("res://images/statuses/ef1.png"))
