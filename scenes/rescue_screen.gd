extends Node3D

@onready var dialogue_box: Node = $MarginContainer/DialogueBox
var step: int = 0

func _ready() -> void:
	init_step_0()

func _on_dialogue_box_next_button_pressed() -> void:
	next_step()

func next_step() -> void:
	if step == 0:
		init_step_1()
	else:
		end_step()
	
	step += 1

func init_step_0() -> void:
	dialogue_box.set_speaker_name(Princes.get_prince_name(WorldState.current_world))
	dialogue_box.set_message("Thank you for saving me!")

func init_step_1() -> void:
	dialogue_box.set_message("Please save my other friend, too.")

func end_step() -> void:
	WorldState.end_rescue()
