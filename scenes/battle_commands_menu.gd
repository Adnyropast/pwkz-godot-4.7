extends Control

signal next_stage_button_pressed
signal next_phase_button_pressed
signal battle_info_button_pressed
signal lose_battle_button_pressed
signal pass_button_pressed
signal attack_button_pressed
signal defend_button_pressed
signal heal_button_pressed
@onready var pass_button: Button = $MarginContainer/VBoxContainer/ButtonPass
@onready var next_phase_button: Button = $MarginContainer/VBoxContainer/ButtonNextPhase
@onready var next_stage_button: Button = $MarginContainer/VBoxContainer/ButtonNextStage
@onready var lose_battle_button: Button = $MarginContainer/VBoxContainer/ButtonLoseBattle

func _ready() -> void:
	refresh_debug_buttons()

func _on_button_next_stage_pressed() -> void:
	next_stage_button_pressed.emit()

func _on_button_next_phase_pressed() -> void:
	next_phase_button_pressed.emit()

func _on_button_battle_info_pressed() -> void:
	battle_info_button_pressed.emit()

func _on_button_retire_pressed() -> void:
	pause()
	PopupInterfaces.open_return_to_title_popup(unpause)

func _on_button_lose_battle_pressed() -> void:
	lose_battle_button_pressed.emit()

func _on_button_pass_pressed() -> void:
	pass_button_pressed.emit()

func _on_button_attack_pressed() -> void:
	attack_button_pressed.emit()

func _on_button_defend_pressed() -> void:
	defend_button_pressed.emit()

func _on_button_heal_pressed() -> void:
	heal_button_pressed.emit()

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func unpause() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT

func refresh_debug_buttons() -> void:
	if Debug.is_debug_on():
		pass_button.show()
		next_phase_button.show()
		next_stage_button.show()
		lose_battle_button.show()
	else:
		pass_button.hide()
		next_phase_button.hide()
		next_stage_button.hide()
		lose_battle_button.hide()
