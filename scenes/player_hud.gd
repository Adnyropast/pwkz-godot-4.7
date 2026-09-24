extends Control

@onready var player_texture: TextureRect = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/PlayerTexture
@onready var hp_bar: ProgressBar = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HPBar
@onready var hp_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/HPLabel
@onready var max_hp_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/MaxHPLabel
@onready var statuses_container: Container = $MarginContainer/HBoxContainer/StatusesContainer

func _ready() -> void:
	player_texture.texture = preload("res://images/player/c1-1.png")
	hp_bar.max_value = Player.MAX_HP
	hp_bar.value = Player.hp
	max_hp_label.text = str(Player.MAX_HP)
	hp_label.text = str(Player.hp)
	Player.player_defeated.connect(on_player_defeated)
	Player.hp_changed.connect(on_player_hp_changed)
	Player.statuses_changed.connect(on_player_statuses_changed)

func on_player_defeated() -> void:
	player_texture.hide()

func on_player_hp_changed() -> void:
	hp_label.text = str(Player.hp)
	hp_bar.value = Player.hp

func on_player_statuses_changed() -> void:
	for child in statuses_container.get_children():
		statuses_container.remove_child(child)
	
	if Player.is_defending:
		var item = preload("res://scenes/player_hud_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_texture(preload("res://images/statuses/ef1.png"))
