extends Node

class_name BaseAction

signal ended

func perform(_sender: Sender) -> void:
	pass

func step_end() -> void:
	ended.emit()
