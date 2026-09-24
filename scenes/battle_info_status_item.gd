extends Control

@onready var status_texture: TextureRect = $PanelContainer/MarginContainer/HBoxContainer/CenterContainer/StatusTexture
@onready var status_label: Label = $PanelContainer/MarginContainer/HBoxContainer/StatusLabel

func set_texture(texture: Texture) -> void:
	status_texture.texture = texture

func set_status_name(status_name: String) -> void:
	status_label.text = status_name
