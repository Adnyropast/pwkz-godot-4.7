extends Node3D

@onready var commands_menu_node: Node = $HBoxContainer/MarginContainer/BattleCommandsMenu
@onready var text_box_node: Node = $HBoxContainer/BattleTextBoxContainer/BattleTextBox
@onready var player_hud: Node = $MarginContainer/PlayerHUD
@onready var camera: Node = $BattleCamera
var turn_system: TurnSystem = TurnSystem.new()
var one_action: bool

func _ready() -> void:
	commands_menu_node.faded_in.connect(camera.on_commands_menu_fade_in)
	commands_menu_node.faded_out.connect(camera.on_commands_menu_fade_out)
	text_box_node.pause()
	text_box_node.hide()
	commands_menu_node.pause()
	commands_menu_node.hide()
	player_hud.hide()

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
	if lock_one_action():
		commands_menu_node.pause()
		commands_menu_node.hide()
		var action = PlayerIdle.new()
		action.ended.connect(turn_system.end_turn)
		action.perform(text_box_node.sender)

func _on_battle_commands_menu_attack_button_pressed() -> void:
	if lock_one_action():
		commands_menu_node.pause()
		commands_menu_node.hide()
		var action = PlayerAttack.new()
		action.ended.connect(turn_system.end_turn)
		action.perform(text_box_node.sender)

func _on_battle_commands_menu_defend_button_pressed() -> void:
	if lock_one_action():
		commands_menu_node.pause()
		commands_menu_node.hide()
		var action = PlayerDefend.new()
		action.ended.connect(turn_system.end_turn)
		action.perform(text_box_node.sender)

func _on_battle_commands_menu_heal_button_pressed() -> void:
	if lock_one_action():
		commands_menu_node.pause()
		commands_menu_node.hide()
		var action = PlayerHeal.new()
		action.ended.connect(turn_system.end_turn)
		action.perform(text_box_node.sender)

func _on_battle_camera_intro_animation_finished() -> void:
	setup_turn()
	player_hud.show()

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
	Player.on_turn_start()
	commands_menu_node.show()
	commands_menu_node.unpause()
	unlock_one_action()

func on_enemy_turn() -> void:
	Enemy.on_turn_start()
	EnemyActionPicker.pick_action(text_box_node.sender, on_enemy_turn_end)
	camera.on_enemy_action_start()

func on_enemy_turn_end() -> void:
	camera.on_enemy_action_end()
	turn_system.end_turn()

func on_victory() -> void:
	end_phase()

func on_defeat() -> void:
	PopupInterfaces.open_defeat_popup()

func unlock_one_action() -> void:
	one_action = false

func lock_one_action() -> bool:
	if not one_action:
		one_action = true
		return true
	return false

func setup_turn() -> void:
	turn_system.defeat.connect(on_defeat)
	turn_system.victory.connect(on_victory)
	turn_system.player_turn.connect(on_player_turn)
	turn_system.enemy_turn.connect(on_enemy_turn)
	turn_system.start()
