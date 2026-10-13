extends Node3D

@onready var container: Node3D = $BackgroundDistance
const MIN_X: float = -16
const MAX_X: float = 16
const MIN_ANGLE: float = 4.0/8 * TAU
const MAX_ANGLE: float = 5.0/8 * TAU
const MIN_SPEED: float = 0.1
const MAX_SPEED: float = 0.3
var timeout: float = 0

func _process(delta: float) -> void:
	timeout -= delta
	if timeout <= 0:
		create_drop()
		timeout = randf_range(0.125, 0.5)

func create_drop() -> void:
	var node: Node3D = preload("res://scenes/background_animations/rain_background_animation_drop.tscn").instantiate()
	var left_ratio: float = randf()
	node.position.x = MAX_X + left_ratio * (MIN_X - MAX_X)
	node.position.y = 9
	var speed_angle: float = MAX_ANGLE + left_ratio * (MIN_ANGLE - MAX_ANGLE)
	var vector2: Vector2 = Vector2.from_angle(speed_angle)
	var speed_x: float = vector2.x
	var speed_y: float = vector2.y
	var speed_z: float = 0
	var speed_norm: float = randf_range(MIN_SPEED, MAX_SPEED)
	node.speed = Vector3(speed_x, speed_y, speed_z).normalized() * speed_norm
	container.add_child(node)
