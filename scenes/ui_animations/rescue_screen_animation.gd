extends Control

@onready var container: Control = $Container
const SPEED: float = 2
var timeout: float = 0

func _process(delta: float) -> void:
	timeout -= delta
	if timeout <= 0:
		create_particles()
		timeout = randf_range(0.25, 0.75)

func create_particles() -> void:
	var count: int = randi_range(7, 9)
	var angle_offset: float = randf_range(0, TAU)
	for i in range(0, count):
		create_particle(i, count, angle_offset)

func create_particle(index: float, count: float, angle_offset: float) -> void:
	var angle: float = angle_offset + index / count * TAU
	var node: Control = preload("res://scenes/ui_animations/rescue_screen_animation_single_particle.tscn").instantiate()
	var speed: Vector2 = Vector2.from_angle(angle) * SPEED
	node.speed = speed
	container.add_child(node)
