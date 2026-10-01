extends Control

signal next_button_pressed

@onready var name_label: Label = $VBoxContainer/LabelName
@onready var message_label: Label = $VBoxContainer/PanelContainer/MarginContainer/LabelMessage
@onready var text_display_animation_player = $TextDisplayAnimationPlayer

func _on_button_next_pressed() -> void:
	pause()
	next_button_pressed.emit()

func on_text_advance() -> void:
	message_label.visible_characters += 1
	if message_label.visible_characters > message_label.get_total_character_count():
		text_display_animation_player.stop()

func set_speaker_name(speaker_name: String) -> void:
	name_label.text = speaker_name

func set_message(message: String) -> void:
	message_label.text = message
	message_label.visible_characters = 0
	text_display_animation_player.play("dialogue_box_text_display")
	unpause()

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func unpause() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
