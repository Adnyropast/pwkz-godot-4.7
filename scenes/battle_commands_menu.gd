extends Control

func _on_button_next_stage_pressed() -> void:
	Worlds.next_stage()

func _on_button_next_phase_pressed() -> void:
	StagePhases.next_phase()
