extends Node

class_name PopupInterfaces

static func open_end_results_popup(callback_callable: Callable) -> void:
	var tree: SceneTree = Engine.get_main_loop()
	var popup = preload("res://scenes/end_results_popup.tscn").instantiate()
	var continue_button_pressed: Signal = popup.continue_button_pressed
	continue_button_pressed.connect(callback_callable)
	continue_button_pressed.connect(popup.queue_free)
	tree.root.add_child(popup)

static func open_rewards_popup(callback_callable: Callable) -> void:
	var tree: SceneTree = Engine.get_main_loop()
	var popup = preload("res://scenes/rewards_popup.tscn").instantiate()
	var next_button_pressed: Signal = popup.next_button_pressed
	next_button_pressed.connect(callback_callable)
	next_button_pressed.connect(popup.queue_free)
	tree.root.add_child(popup)
