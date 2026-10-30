extends Control

@onready var speed_node: Control = $Speed
@onready var rotate_node: Control = $Speed/Rotate
var speed: Vector2

func _process(delta: float) -> void:
	speed = speed * pow(1 / 1.05, 60 * delta)
	speed_node.offset_transform_position += speed * 60 * delta
	rotate_node.offset_transform_rotation = atan2(speed.normalized().y, speed.normalized().x)
