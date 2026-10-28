extends Node

class_name WorldColors

static var BACKGROUNDS: Array[Color] = [
	Color.html("#272727"),
	Color.html("#382405"),
	Color.html("#005002"),
	Color.html("#000050"),
	Color.html("#500006"),
	Color.html("#504D00"),
	Color.html("#50354A"),
	Color.html("#310050"),
]

static var SCREENS: Array[Color] = [
	Color.html("#6A6A6A"),
	Color.html("#7F6641"),
	Color.html("#3B9B3D"),
	Color.html("#3B3B9B"),
	Color.html("#9B3B42"),
	Color.html("#9B973B"),
	Color.html("#9B3B93"),
	Color.html("#763B9B"),
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
