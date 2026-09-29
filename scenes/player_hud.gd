extends Control

@onready var player_texture: TextureRect = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/PlayerShakeNode/PlayerTexture
@onready var player_texture_animation_player: AnimationPlayer = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/PlayerShakeNode/PlayerTextureAnimationPlayer
@onready var hp_bar: ProgressBar = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HPBar
@onready var hp_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/HPLabel
@onready var max_hp_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/MaxHPLabel
@onready var statuses_container: Container = $MarginContainer/HBoxContainer/StatusesContainer

func _ready() -> void:
	player_texture.texture = Player.get_player_texture()
	hp_bar.max_value = Player.MAX_HP
	hp_bar.value = Player.hp
	max_hp_label.text = str(Player.MAX_HP)
	hp_label.text = str(Player.hp)
	Player.player_defeated.connect(on_player_defeated)
	Player.hp_changed.connect(on_player_hp_changed)
	Player.statuses_changed.connect(on_player_statuses_changed)
	Player.portrait_changed.connect(on_player_portrait_changed)

func on_player_defeated() -> void:
	player_texture.hide()

func on_player_portrait_changed() -> void:
	player_texture.texture = Player.get_player_texture()
	
	if Player.portrait_is_hurt:
		player_texture_animation_player.play("player_hurt")
	elif Player.portrait_is_attacking:
		player_texture_animation_player.play("player_attack")

func on_player_hp_changed() -> void:
	hp_label.text = str(Player.hp)
	hp_bar.value = Player.hp

func on_player_statuses_changed() -> void:
	for child in statuses_container.get_children():
		statuses_container.remove_child(child)
	
	if Player.is_defending():
		var item = preload("res://scenes/player_hud_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_texture(preload("res://images/statuses/ef1.png"))
		item.set_info(str(Player.defending_turns))
	
	if Player.is_enduring():
		var item = preload("res://scenes/player_hud_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_texture(preload("res://images/statuses/ef2.png"))
		item.set_info(str(Player.enduring_turns))
	
	if Player.has_reprisal():
		var item = preload("res://scenes/player_hud_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_texture(preload("res://images/statuses/ef3.png"))
		item.set_info(str(Player.reprisal_turns))
	
	if Player.has_revive():
		var item = preload("res://scenes/player_hud_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_texture(preload("res://images/statuses/ef4.png"))
		item.set_info(str(Player.revive_turns))
	
	if Player.has_attack_buff():
		var item = preload("res://scenes/player_hud_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_texture(preload("res://images/statuses/ef5.png"))
		item.set_info(str(Player.attack_buff_turns))
	
	if Player.has_defense_buff():
		var item = preload("res://scenes/player_hud_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_texture(preload("res://images/statuses/ef6.png"))
		item.set_info(str(Player.defense_buff_turns))
