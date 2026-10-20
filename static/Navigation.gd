extends Node

class_name Navigation

static func set_first_button(button: Button) -> void:
	set_first_button_ready(button)
	set_first_button_visibility_changed(button)
	button_grab_focus(button)

static func set_first_button_ready(button: Button) -> void:
	button.ready.connect(button_grab_focus.bind(button))

static func set_first_button_visibility_changed(button: Button) -> void:
	button.visibility_changed.connect(button_grab_focus.bind(button))

static func button_grab_focus(button: Button) -> void:
	if button.is_visible_in_tree():
		Sfx.reset_sound_select()
		button.grab_focus.call_deferred()
