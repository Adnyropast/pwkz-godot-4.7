extends Node

class_name WorldColors

static var BACKGROUNDS: Array[Color] = [
	Color.html("#3E3E3E"),
	Color.html("#613B01"),
	Color.html("#017966"),
	Color.html("#1171C1"),
	Color.html("#8D0136"),
	Color.html("#F2ED88"),
	Color.html("#FFA8EB"),
	Color.html("#9C01FF"),
]

static var SCREENS: Array[Color] = [
	Color.html("#7D7D7D"),
	Color.html("#613B01"),
	Color.html("#017966"),
	Color.html("#1171C1"),
	Color.html("#8D0136"),
	Color.html("#FFC501"),
	Color.html("#FFA8EB"),
	Color.html("#390179"),
]

static func get_background_color(world: int) -> Color:
	return BACKGROUNDS[world - 1]

static func get_screen_color(world: int) -> Color:
	return SCREENS[world - 1]
