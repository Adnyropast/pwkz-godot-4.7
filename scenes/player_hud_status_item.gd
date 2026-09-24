extends Control

@onready var status_texture: TextureRect = $CenterContainer/StatusTexture

func set_texture(texture: Texture) -> void:
	status_texture.texture = texture
