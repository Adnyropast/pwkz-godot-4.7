extends Control

var victory: bool
@onready var label_node: Label = $MarginContainer/PanelContainer/MarginContainer/Label

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		confirm()

func set_victory() -> void:
	victory = true
	label_node.text = "You won!"
	show()

func confirm() -> void:
	hide()
	
	if victory:
		StagePhases.next_phase()
