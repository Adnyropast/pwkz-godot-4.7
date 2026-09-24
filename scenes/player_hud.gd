extends Control

@onready var player_texture: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/PlayerTexture
@onready var hp_bar: ProgressBar = $MarginContainer/VBoxContainer/HBoxContainer2/HPBar

func _ready() -> void:
	player_texture.texture = preload("res://images/player/c1-1.png")
	hp_bar.max_value = Player.MAX_HP
	hp_bar.value = Player.hp
	Player.player_defeated.connect(on_player_defeated)
	Player.hp_changed.connect(on_player_hp_changed)

func on_player_defeated() -> void:
	player_texture.hide()

func on_player_hp_changed() -> void:
	hp_bar.value = Player.hp
