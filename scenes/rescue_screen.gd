extends Node3D

const STEP_0: int = 0
const STEP_1: int = 1
const STEP_END: int = 2
const STEP_END_RESULTS: int = 3

@onready var dialogue_box: Node = $MarginContainer/DialogueBox
var step: int = STEP_0

func _ready() -> void:
	init_step(STEP_0)

func _on_dialogue_box_next_button_pressed() -> void:
	cleanup_step()

func init_step(new_step: int) -> void:
	step = new_step
	
	if step == STEP_0:
		init_step_0()
	elif step == STEP_1:
		init_step_1()
	elif step == STEP_END_RESULTS:
		init_step_end_results()
	else:
		end_step()

func cleanup_step() -> void:
	if step == STEP_0:
		cleanup_step_0()
	elif step == STEP_1:
		cleanup_step_1()
	elif step == STEP_END_RESULTS:
		cleanup_step_end_results()
	else:
		end_step()

func init_step_0() -> void:
	dialogue_box.set_speaker_name(Princes.get_prince_name(WorldState.current_world))
	dialogue_box.set_message("Thank you for saving me!")

func cleanup_step_0() -> void:
	if WorldState.is_final_world():
		init_step(STEP_END_RESULTS)
	else:
		init_step(STEP_1)

func init_step_1() -> void:
	dialogue_box.set_message("Please save my other friend, too.")

func cleanup_step_1() -> void:
	init_step(STEP_END)

func init_step_end_results() -> void:
	PopupInterfaces.open_end_results_popup(cleanup_step)

func cleanup_step_end_results() -> void:
	init_step(STEP_1)

func end_step() -> void:
	WorldState.end_rescue()
