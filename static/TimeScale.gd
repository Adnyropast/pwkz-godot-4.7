extends Node

class_name TimeScale

static var action_skip_speed_factor: float = 1

static func refresh_time_scale() -> void:
	Engine.time_scale = action_skip_speed_factor

static func action_skip_speed_up() -> void:
	action_skip_speed_factor = 10
	refresh_time_scale()

static func action_skip_speed_reset() -> void:
	action_skip_speed_factor = 1
	refresh_time_scale()
