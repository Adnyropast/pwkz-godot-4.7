extends Node3D

@onready var commands_menu_node: Node = $HBoxContainer/MarginContainer/BattleCommandsMenu
@onready var text_box_node: Node = $HBoxContainer/BattleTextBoxContainer/BattleTextBox
@onready var enemy_texture: TextureRect = $CenterContainer/EnemyTexture
var turn_system: TurnSystem = TurnSystem.new()

func _ready() -> void:
	enemy_texture.texture = Enemy.get_texture()
	Enemy.enemy_defeated.connect(on_enemy_defeated)
	
	text_box_node.pause()
	text_box_node.hide()
	commands_menu_node.pause()
	commands_menu_node.hide()
	
	turn_system.defeat.connect(on_defeat)
	turn_system.victory.connect(on_victory)
	turn_system.player_turn.connect(on_player_turn)
	turn_system.enemy_turn.connect(on_enemy_turn)
	turn_system.start()

func _on_battle_commands_menu_next_phase_button_pressed() -> void:
	end_phase()

func _on_battle_commands_menu_next_stage_button_pressed() -> void:
	Stages.next_stage()

func _on_battle_commands_menu_battle_info_button_pressed() -> void:
	commands_menu_node.pause()
	PopupInterfaces.open_battle_info_screen_popup(on_battle_info_screen_closed)

func _on_battle_commands_menu_lose_battle_button_pressed() -> void:
	commands_menu_node.pause()
	PopupInterfaces.open_defeat_popup()

func _on_battle_commands_menu_pass_button_pressed() -> void:
	commands_menu_node.pause()
	commands_menu_node.hide()
	var action = PlayerIdle.new()
	action.ended.connect(turn_system.end_turn)
	action.perform(text_box_node.sender)

func _on_battle_commands_menu_attack_button_pressed() -> void:
	commands_menu_node.pause()
	commands_menu_node.hide()
	var action = PlayerAttack.new()
	action.ended.connect(turn_system.end_turn)
	action.perform(text_box_node.sender)

func end_phase() -> void:
	commands_menu_node.hide()
	
	if WorldState.has_more_phases():
		Phases.next_phase()
	else:
		if WorldState.is_final_stage():
			Phases.next_phase_rescue()
		else:
			text_box_node.sender.send("You won!", PopupInterfaces.open_rewards_popup.bind(on_rewards_closed))

func on_rewards_closed() -> void:
	PopupInterfaces.open_equip_screen_popup(on_equip_screen_closed)

func on_equip_screen_closed() -> void:
	Phases.next_phase()

func on_battle_info_screen_closed() -> void:
	commands_menu_node.unpause()

func on_player_turn() -> void:
	commands_menu_node.show()
	commands_menu_node.unpause()

func on_enemy_turn() -> void:
	EnemyActionPicker.pick_action(text_box_node.sender, turn_system.end_turn)

func on_victory() -> void:
	end_phase()

func on_enemy_defeated() -> void:
	enemy_texture.hide()

func on_defeat() -> void:
	PopupInterfaces.open_defeat_popup()
