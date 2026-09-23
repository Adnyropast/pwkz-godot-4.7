extends Control

@onready var player_texture: TextureRect = $MarginContainer/VBoxContainer/PlayerTexture

func _ready() -> void:
	player_texture.texture = preload("res://images/player/c1-1.png")
	Player.player_defeated.connect(on_player_defeated)

func on_player_defeated() -> void:
	player_texture.hide()
