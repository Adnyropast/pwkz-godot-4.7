extends Node

class_name TimeScale

static var action_skip_speed_factor: float = 1
static var final_blow_speed_factor: float = 1

static func refresh_time_scale() -> void:
	Engine.time_scale = action_skip_speed_factor * final_blow_speed_factor

static func action_skip_speed_up() -> void:
	action_skip_speed_factor = 10
	refresh_time_scale()

static func action_skip_speed_reset() -> void:
	action_skip_speed_factor = 1
	refresh_time_scale()

static func final_blow_speed_down() -> void:
	final_blow_speed_factor = 0.1
	refresh_time_scale()

static func final_blow_speed_reset() -> void:
	final_blow_speed_factor = 1
	refresh_time_scale()

static func start_final_blow() -> void:
	final_blow_speed_down()
	var tween: Tween = Engine.get_main_loop().root.create_tween()
	tween.tween_callback(final_blow_speed_reset).set_delay(0.2)
