extends Control

@onready var player_texture: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/PlayerTexture
@onready var hp_bar: ProgressBar = $MarginContainer/VBoxContainer/VBoxContainer/HPBar
@onready var hp_label: Label = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/HPLabel
@onready var max_hp_label: Label = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/MaxHPLabel

func _ready() -> void:
	player_texture.texture = preload("res://images/player/c1-1.png")
	hp_bar.max_value = Player.MAX_HP
	hp_bar.value = Player.hp
	max_hp_label.text = str(Player.MAX_HP)
	hp_label.text = str(Player.hp)
	Player.player_defeated.connect(on_player_defeated)
	Player.hp_changed.connect(on_player_hp_changed)

func on_player_defeated() -> void:
	player_texture.hide()

func on_player_hp_changed() -> void:
	hp_label.text = str(Player.hp)
	hp_bar.value = Player.hp
