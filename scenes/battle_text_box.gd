extends Control

@onready var label_node: Label = $MarginContainer/PanelContainer/MarginContainer/Label
signal closed

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		confirm()

func set_victory() -> void:
	label_node.text = "You won!"
	show()

func confirm() -> void:
	hide()
	
	closed.emit()
