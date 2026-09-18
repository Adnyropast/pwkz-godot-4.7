extends Control

signal next_stage_button_pressed
signal next_phase_button_pressed
signal battle_info_button_pressed

func _on_button_next_stage_pressed() -> void:
	next_stage_button_pressed.emit()

func _on_button_next_phase_pressed() -> void:
	next_phase_button_pressed.emit()

func _on_button_battle_info_pressed() -> void:
	battle_info_button_pressed.emit()

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func unpause() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
