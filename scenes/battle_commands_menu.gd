extends Control

var stage_node: Node

func _on_button_next_stage_pressed() -> void:
	Worlds.next_stage()

func _on_button_next_phase_pressed() -> void:
	stage_node.next_phase()
