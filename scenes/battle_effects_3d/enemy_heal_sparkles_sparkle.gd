extends Node3D

@onready var speed_node: Node3D = $Speed
var speed: Vector3 = Vector3(0, 0.03, 0)

func _process(delta: float) -> void:
	speed = speed * pow(1 / 1.01, 60 * delta)
	speed_node.position += speed * 60 * delta
