extends Control

enum Tabs {
	ENEMY,
	PLAYER,
}

signal close_button_pressed
@onready var name_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/NameLabel
@onready var hp_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/HPLabel
@onready var max_hp_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/MaxHPLabel
@onready var hp_bar: ProgressBar = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/VBoxContainer/HPBar
@onready var attack_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/HBoxContainer/AttackLabel
@onready var defense_label: Label = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/HBoxContainer2/DefenseLabel
@onready var statuses_container: Container = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/StatusesContainer
@onready var first_button: Button = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer/VBoxContainer/EnemyButton
@onready var enemy_button: Button = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer/VBoxContainer/EnemyButton
@onready var player_button: Button = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer/VBoxContainer/PlayerButton
var tab: Tabs = Tabs.ENEMY

func _ready() -> void:
	refresh_button_tabs()
	refresh_tabs()
	Navigation.button_grab_focus(first_button)

func _on_enemy_button_focus_entered() -> void:
	set_tab_enemy()

func _on_player_button_focus_entered() -> void:
	set_tab_player()

func _on_button_close_pressed() -> void:
	close_button_pressed.emit()

func refresh_button_tabs() -> void:
	enemy_button.text = Enemy.get_enemy_name()
	player_button.text = Player.get_player_name()

func update_stats_enemy() -> void:
	name_label.text = Enemy.get_enemy_name()
	max_hp_label.text = str(Enemy.get_max_hp())
	hp_label.text = str(Enemy.hp)
	hp_bar.max_value = Enemy.get_max_hp()
	hp_bar.value = Enemy.hp
	attack_label.text = str(Enemy.get_stat_attack())
	defense_label.text = str(Enemy.get_stat_defense())

func update_statuses_enemy() -> void:
	for child in statuses_container.get_children():
		statuses_container.remove_child(child)
	
	if Enemy.is_defending:
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Defend")
		item.set_texture(preload("res://images/statuses/ef1.png"))
	
	if Enemy.has_absorb_barrier:
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Absorb Barrier")
		item.set_texture(preload("res://images/statuses/ef7.png"))
	
	if Enemy.has_reflect_barrier:
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Reflect Barrier")
		item.set_texture(preload("res://images/statuses/ef3.png"))
	
	if Enemy.attack_buff_turns > 0:
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Attack +" + str(floori(Enemy.attack_buff_value * 100)) + "% " + str(Enemy.attack_buff_turns) + " turns")
		item.set_texture(preload("res://images/statuses/ef5.png"))
	
	if Enemy.defense_buff_turns > 0:
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Defense +" + str(floori(Enemy.defense_buff_value * 100)) + "% " + str(Enemy.defense_buff_turns) + " turns")
		item.set_texture(preload("res://images/statuses/ef6.png"))

func update_stats_player() -> void:
	name_label.text = Player.get_player_name()
	max_hp_label.text = str(Player.MAX_HP)
	hp_label.text = str(Player.hp)
	hp_bar.max_value = Player.MAX_HP
	hp_bar.value = Player.hp
	attack_label.text = str(Player.get_stat_attack())
	defense_label.text = str(Player.get_stat_defense())

func update_statuses_player() -> void:
	for child in statuses_container.get_children():
		statuses_container.remove_child(child)
	
	if Player.is_defending():
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Defend " + str(Player.defending_turns) + " turns")
		item.set_texture(preload("res://images/statuses/ef1.png"))
	
	if Player.is_enduring():
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Endure " + str(Player.enduring_turns) + " turns")
		item.set_texture(preload("res://images/statuses/ef2.png"))
	
	if Player.has_reprisal():
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Reprisal " + str(Player.reprisal_turns) + " turns")
		item.set_texture(preload("res://images/statuses/ef3.png"))
	
	if Player.has_revive():
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Revive " + str(Player.revive_turns) + " turns")
		item.set_texture(preload("res://images/statuses/ef4.png"))
	
	if Player.has_attack_buff():
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Attack +" + str(floori(Player.attack_buff_value * 100)) + "% " + str(Player.attack_buff_turns) + " turns")
		item.set_texture(preload("res://images/statuses/ef5.png"))
	
	if Player.has_defense_buff():
		var item = preload("res://scenes/battle_info_status_item.tscn").instantiate()
		statuses_container.add_child(item)
		item.set_status_name("Defense +" + str(floori(Player.defense_buff_value * 100)) + "% " + str(Player.defense_buff_turns) + " turns")
		item.set_texture(preload("res://images/statuses/ef6.png"))

func refresh_tabs() -> void:
	if tab == Tabs.ENEMY:
		update_stats_enemy()
		update_statuses_enemy()
	else:
		update_stats_player()
		update_statuses_player()

func set_tab_enemy() -> void:
	tab = Tabs.ENEMY
	refresh_tabs()

func set_tab_player() -> void:
	tab = Tabs.PLAYER
	refresh_tabs()
