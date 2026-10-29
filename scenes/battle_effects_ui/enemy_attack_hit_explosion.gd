extends Control

@onready var container: Control = $"."

func _ready() -> void:
	setup_particles()

func setup_particles() -> void:
	var angle_offset: float = randf_range(0.5/4 * PI, 1.5/4 * PI)
	for i in range(0, 3):
		for j in range(0, 4):
			var angle: float = angle_offset + i * PI/4 + j / 4.0 * TAU
			var speed: float = 10 * (i+2)/5.0 * randf_range(1, 1.2)
			var node: Control = preload("res://scenes/battle_effects_ui/enemy_attack_hit_particle.tscn").instantiate()
			node.speed.x = cos(angle) * speed
			node.speed.y = sin(angle) * speed
			container.add_child(node)
