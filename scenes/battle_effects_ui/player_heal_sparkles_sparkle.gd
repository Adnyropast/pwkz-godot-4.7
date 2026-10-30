extends Control

@onready var speed_node: Control = $Speed
var speed: Vector2 = Vector2(0, -1)

func _process(delta: float) -> void:
	speed = speed * pow(1 / 1.01, 60 * delta)
	speed_node.offset_transform_position += speed * 60 * delta
