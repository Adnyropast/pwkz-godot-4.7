extends Node3D

@onready var container: Node3D = $ForegroundDistance

func _ready() -> void:
	delay_create_all()
	var tween: Tween = create_tween()
	tween.tween_callback(queue_free).set_delay(2.0)

func delay_create_all() -> void:
	var angle_offset: float = randf_range(0, TAU/3)
	for i in range(0, 3):
		var delay: float = i * 0.2
		var angle: float = angle_offset + i/3.0 * TAU
		var distance: float = randf_range(2, 4)
		delay_create(delay, cos(angle) * distance, sin(angle) * distance)
		delay += 0.1
		angle += PI
		distance = randf_range(2, 4)
		delay_create(delay, cos(angle) * distance, sin(angle) * distance)

func delay_create(delay: float, x: float, y: float) -> void:
	var tween: Tween = create_tween()
	tween.tween_callback(create_sparkle.bind(x, y)).set_delay(delay)

func create_sparkle(x: float, y: float) -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/enemy_heal_sparkles_sparkle.tscn").instantiate()
	node.position.x = x
	node.position.y = y
	container.add_child(node)
