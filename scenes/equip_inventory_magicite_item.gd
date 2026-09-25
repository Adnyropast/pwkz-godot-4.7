extends Control

@onready var magicite_texture: TextureRect = $HBoxContainer/MagiciteTexture
@onready var name_label: Label = $HBoxContainer/NameLabel
@onready var quantity_label: Label = $HBoxContainer/HBoxContainer/QuantityLabel

func set_magicite_texture(texture: Texture) -> void:
	magicite_texture.texture = texture

func set_magicite_name(magicite_name: String) -> void:
	name_label.text = magicite_name

func set_quantity(quantity: int) -> void:
	quantity_label.text = str(quantity)
