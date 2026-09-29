extends Node

var debug_on: bool

func is_debug_on() -> bool:
	return debug_on

func toggle_debug_on() -> void:
	debug_on = !debug_on
