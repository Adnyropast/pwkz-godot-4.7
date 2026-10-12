extends Node3D

@onready var speed_node: Node3D = $Speed
@export var force: Vector3
var speed: Vector3

func _ready() -> void:
	var tween: Tween = create_tween()
	tween.tween_callback(queue_free).set_delay(10.0)

func _process(delta: float) -> void:
	speed += force * delta
	speed_node.position += speed
