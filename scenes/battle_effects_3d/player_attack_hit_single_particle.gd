extends Node3D

@onready var speed_node: Node3D = $Speed
@onready var rotate_node: Node3D = $Speed/Rotate
var speed: Vector3

func _process(delta: float) -> void:
	speed = speed * pow(1 / 1.05, 60 * delta)
	speed_node.position += speed
	rotate_node.rotation.z = atan2(speed.normalized().y, speed.normalized().x)
