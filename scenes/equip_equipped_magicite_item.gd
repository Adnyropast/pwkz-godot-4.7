extends Control

signal button_pressed
@onready var magicite_texture: TextureRect = $PanelContainer/MarginContainer/HBoxContainer/MagiciteTexture
@onready var name_label: Label = $PanelContainer/MarginContainer/HBoxContainer/NameLabel
@onready var item_button: Button = $ItemButton
var index: int

func _on_item_button_pressed() -> void:
	button_pressed.emit(index)

func set_magicite_texture(texture: Texture) -> void:
	magicite_texture.texture = texture

func set_magicite_name(magicite_name: String) -> void:
	name_label.text = magicite_name

func set_index(p_index: int) -> void:
	index = p_index

func set_magicite(magicite: Magicite) -> void:
	if magicite == null:
		set_magicite_texture(null)
		set_magicite_name("---")
	else:
		set_magicite_texture(magicite.get_texture())
		set_magicite_name(magicite.name)

func make_grab_focus() -> void:
	Navigation.button_grab_focus(item_button)
