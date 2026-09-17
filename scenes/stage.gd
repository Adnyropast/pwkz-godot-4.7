extends Node3D

class_name StageScene

@onready var commands_menu_node: Node = $HBoxContainer/MarginContainer/BattleCommandsMenu
@onready var text_box_node: Node = $HBoxContainer/BattleTextBoxContainer/BattleTextBox

func _ready() -> void:
	commands_menu_node.stage_node = self

func next_phase() -> void:
	commands_menu_node.hide()
	
	if StagePhases.has_more_phases():
		StagePhases.next_phase()
	else:
		text_box_node.set_victory()
