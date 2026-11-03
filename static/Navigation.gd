extends Node

class_name Navigation

static func set_first_button_visibility_changed(button: Button) -> void:
	button.visibility_changed.connect(button_grab_focus.bind(button))

static func button_grab_focus(button: Button) -> void:
	if button.is_visible_in_tree():
		Sfx.reset_sound_select()
		button.grab_focus.call_deferred()

static func control_grab_focus(control: Control) -> void:
	if control.is_visible_in_tree():
		Sfx.reset_sound_select()
		control.grab_focus.call_deferred()
