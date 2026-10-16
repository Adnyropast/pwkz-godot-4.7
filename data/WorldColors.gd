extends Node

class_name WorldColors

static var BACKGROUNDS: Array[Color] = [
	Color.html("#404040"),
	Color.html("#7e583a"),
	Color.html("#3f785e"),
	Color.html("#3b8db0"),
	Color.html("#831b1b"),
	Color.html("#f7ec73"),
	Color.html("#f9b8f7"),
	Color.html("#8f4cae"),
]

static var SCREENS: Array[Color] = [
	Color.html("#616161"),
	Color.html("#a56e40"),
	Color.html("#18aa66"),
	Color.html("#2e9ce0"),
	Color.html("#af1818"),
	Color.html("#ebe300"),
	Color.html("#f797ef"),
	Color.html("#6a0b9d"),
]

static var ENEMIES: Array[Color] = [
	Color.html("#E1E1E1"),
	Color.html("#B47310"),
	Color.html("#01FF06"),
	Color.html("#01D9FF"),
	Color.html("#FF0113"),
	Color.html("#FFF501"),
	Color.html("#FF01EB"),
	Color.html("#9C01FF"),
]

static var SCREEN_SHAPES: Array[Color] = [
	Color.html("#c2c2c2"),
	Color.html("#d4751c"),
	Color.html("#12f33f"),
	Color.html("#15e5f4"),
	Color.html("#ff3838"),
	Color.html("#fffb80"),
	Color.html("#f005e8"),
	Color.html("#9a05eb"),
]

static var ARENA_SHAPES: Array[Color] = [
	Color.html("#c4c4c4"),
	Color.html("#c97026"),
	Color.html("#1ae03b"),
	Color.html("#04cde7"),
	Color.html("#f50000"),
	Color.html("#fffcd6"),
	Color.html("#ff47e7"),
	Color.html("#bb00ff"),
]

static func get_background_color(world: int) -> Color:
	return BACKGROUNDS[world - 1]

static func get_screen_color(world: int) -> Color:
	return SCREENS[world - 1]

static func get_enemy_color(world: int) -> Color:
	return ENEMIES[world - 1]

static func get_screen_shape_color(world: int) -> Color:
	return SCREEN_SHAPES[world - 1]

static func get_arena_shape_color(world: int) -> Color:
	return ARENA_SHAPES[world - 1]
