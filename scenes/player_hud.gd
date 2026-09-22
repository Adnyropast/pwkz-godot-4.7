extends Control

@onready var player_texture: TextureRect = $MarginContainer/VBoxContainer/PlayerTexture

func _ready() -> void:
	player_texture.texture = preload("res://images/player/c1-1.png")
