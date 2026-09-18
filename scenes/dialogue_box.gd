extends Control

signal next_button_pressed

@onready var name_label: Label = $VBoxContainer/LabelName
@onready var message_label: Label = $VBoxContainer/PanelContainer/MarginContainer/LabelMessage

func _on_button_next_pressed() -> void:
	pause()
	next_button_pressed.emit()

func set_speaker_name(speaker_name: String) -> void:
	name_label.text = speaker_name

func set_message(message: String) -> void:
	message_label.text = message
	unpause()

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func unpause() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
