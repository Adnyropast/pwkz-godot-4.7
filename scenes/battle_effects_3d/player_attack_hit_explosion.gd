extends Node3D

@onready var container: Node3D = $Container

func _ready() -> void:
	setup_particles()

func setup_particles() -> void:
	var angle_offset: float = randf_range(0.5/4 * PI, 1.5/4 * PI)
	for i in range(0, 3):
		for j in range(0, 4):
			var angle: float = angle_offset + i * PI/4 + j / 4.0 * TAU
			var speed: float = 0.3 * (i+2)/5 * randf_range(1, 1.2)
			var node: Node3D = preload("res://scenes/battle_effects_3d/player_attack_hit_single_particle.tscn").instantiate()
			node.speed.x = cos(angle) * speed
			node.speed.y = sin(angle) * speed
			container.add_child(node)
