extends Node3D

@onready var raising_node: Node3D = $Raising
@onready var oscillate_node: Node3D = $Raising/Oscillate
@onready var rotation_reset: Node3D = $Raising/Oscillate/RotationReset
const RAISING_SPEED: float = 0.01
const OSCILLATE_DISTANCE: float = 1
const OSCILLATE_DURATION: float = 3
var raising_force: float = 0.01
var oscillate_angle: float = 0

func _ready() -> void:
	var tween: Tween = create_tween()
	tween.tween_callback(queue_free).set_delay(20.0)

func _process(delta: float) -> void:
	process_raise(delta)
	process_oscillate(delta)

func process_raise(delta: float) -> void:
	raising_force += RAISING_SPEED * delta
	raising_node.position.y += raising_force * 60 * delta

func process_oscillate(delta: float) -> void:
	var angle: float = TAU / OSCILLATE_DURATION * delta
	oscillate_angle += angle
	oscillate_node.position.x = sin(oscillate_angle) * OSCILLATE_DISTANCE
