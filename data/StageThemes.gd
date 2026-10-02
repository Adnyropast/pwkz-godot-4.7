extends Node

class_name StageThemes

const THEMES: Array = [
	[1, 2, 1, 3],
	[1, 1, 2, 3],
	[2, 1, 2, 3],
	[2, 1, 1, 3],
	[1, 1, 2, 3],
	[2, 2, 1, 3],
	[1, 2, 1, 3],
	[1, 2, 2, 3],
]

static func get_theme() -> int:
	return THEMES[WorldState.current_world - 1][WorldState.current_stage - 1]
