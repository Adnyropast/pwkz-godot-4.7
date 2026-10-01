extends Node

func make_fade(callable: Callable) -> void:
	var fade_screen = preload("res://scenes/fade_screen.tscn").instantiate()
	var faded_out: Signal = fade_screen.faded_out
	faded_out.connect(callable)
	add_child(fade_screen)
