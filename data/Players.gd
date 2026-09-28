extends Node

class_name Players

enum Modes {
	MARIA,
	LEONARDO,
}

static func get_player_name(mode: Modes) -> String:
	if mode == Modes.MARIA:
		return "Maria"
	elif mode == Modes.LEONARDO:
		return "Leonardo"
	return ""

static func get_player_texture(mode: Modes) -> Texture:
	if mode == Modes.MARIA:
		return preload("res://images/player/c1-1.png")
	elif mode == Modes.LEONARDO:
		return preload("res://images/player/c2-1.png")
	return null
