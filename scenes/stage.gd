extends Node3D

@onready var commands_menu_node: Node = $HBoxContainer/MarginContainer/BattleCommandsMenu
@onready var text_box_node: Node = $HBoxContainer/BattleTextBoxContainer/BattleTextBox

func _on_battle_commands_menu_next_phase_button_pressed() -> void:
	end_phase()

func _on_battle_commands_menu_next_stage_button_pressed() -> void:
	WorldState.next_stage()

func _on_battle_text_box_closed() -> void:
	PopupInterfaces.open_rewards_popup(on_rewards_closed)

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
	WorldState.next_phase()
