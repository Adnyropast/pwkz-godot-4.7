extends Node3D

@onready var container: Node3D = $BackgroundDistance/GroundLevel
var timeout: float = 0

func _process(delta: float) -> void:
	timeout -= delta
	if timeout <= 0:
		create_ember()
		timeout = randf_range(0.25, 0.75)

func create_ember() -> void:
	var node: Node3D = preload("res://scenes/background_animations/embers_background_animation_ember.tscn").instantiate()
	node.position.x = 15 * randf_range(-1, 1)
	var force_x: float = 0.05 * randf_range(-1, 1)
	var force_y: float = randf_range(0.1, 0.2)
	var force_z: float = 0.001 * randf_range(-1, 1)
	node.force = Vector3(force_x, force_y, force_z)
	container.add_child(node)
