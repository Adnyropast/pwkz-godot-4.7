extends Node3D

@onready var container: Node3D = $ForegroundDistance

func _ready() -> void:
	setup_particles()
	var tween: Tween = create_tween()
	tween.tween_callback(queue_free).set_delay(2.0)

func setup_particles() -> void:
	for i in range(0, 4):
		var angle: float = PI/3 + i / 4.0 * TAU
		var node: Node3D = preload("res://scenes/battle_effects_3d/player_attack_strike_single_particle.tscn").instantiate()
		node.position.x = cos(angle) * 6
		node.position.y = sin(angle) * 6
		node.position.z = 6
		node.speed.x = -cos(angle) * 0.7
		node.speed.y = -sin(angle) * 0.7
		node.speed.z = -0.7
		container.add_child(node)
