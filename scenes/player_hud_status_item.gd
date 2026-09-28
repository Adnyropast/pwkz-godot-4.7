extends Control

@onready var status_texture: TextureRect = $CenterContainer/StatusTexture
@onready var info_label: Label = $Control/InfoLabel

func set_texture(texture: Texture) -> void:
	status_texture.texture = texture

func set_info(text: String) -> void:
	info_label.text = text
