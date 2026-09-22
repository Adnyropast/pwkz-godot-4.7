extends Node3D

@onready var commands_menu_node: Node = $HBoxContainer/MarginContainer/BattleCommandsMenu
@onready var text_box_node: Node = $HBoxContainer/BattleTextBoxContainer/BattleTextBox
@onready var enemy_texture: TextureRect = $CenterContainer/EnemyTexture
var turn_system: TurnSystem = TurnSystem.new()

func _ready() -> void:
	enemy_texture.texture = Enemies.get_enemy_texture(WorldState.get_phase_enemy_id())
	text_box_node.pause()
	text_box_node.hide()
	commands_menu_node.pause()
	commands_menu_node.hide()
	
	turn_system.player_turn.connect(on_player_turn)
	turn_system.enemy_turn.connect(on_enemy_turn)
	turn_system.start_turn()

func _on_battle_commands_menu_next_phase_button_pressed() -> void:
	end_phase()

func _on_battle_commands_menu_next_stage_button_pressed() -> void:
	WorldState.next_stage()

func _on_battle_text_box_closed(is_victory: bool) -> void:
	if is_victory:
		PopupInterfaces.open_rewards_popup(on_rewards_closed)
	else:
		turn_system.end_turn()

func _on_battle_commands_menu_battle_info_button_pressed() -> void:
	commands_menu_node.pause()
	PopupInterfaces.open_battle_info_screen_popup(on_battle_info_screen_closed)

func _on_battle_commands_menu_lose_battle_button_pressed() -> void:
	commands_menu_node.pause()
	PopupInterfaces.open_defeat_popup()

func _on_battle_commands_menu_pass_button_pressed() -> void:
	commands_menu_node.pause()
	commands_menu_node.hide()
	text_box_node.set_player_idle()

func end_phase() -> void:
	commands_menu_node.hide()
	
	if WorldState.has_more_phases():
		WorldState.next_phase()
	else:
		if WorldState.is_final_stage():
			WorldState.next_phase_rescue()
		else:
			text_box_node.set_victory()

func on_rewards_closed() -> void:
	PopupInterfaces.open_equip_screen_popup(on_equip_screen_closed)

func on_equip_screen_closed() -> void:
	WorldState.next_phase()

func on_battle_info_screen_closed() -> void:
	commands_menu_node.unpause()

func on_player_turn() -> void:
	commands_menu_node.show()
	commands_menu_node.unpause()

func on_enemy_turn() -> void:
	text_box_node.set_enemy_idle(WorldState.get_phase_enemy_id())
