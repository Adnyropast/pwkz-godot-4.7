extends Control

@onready var container: Control = $"."

func _ready() -> void:
	delay_create(0.0, 60, 60)
	delay_create(0.2, -60, 0)
	delay_create(0.4, 0, -60)
	var tween: Tween = create_tween()
	tween.tween_callback(queue_free).set_delay(2.0)

func delay_create(delay: float, x: float, y: float) -> void:
	var tween: Tween = create_tween()
	tween.tween_callback(create_explosion.bind(x, y)).set_delay(delay)

func create_explosion(x: float, y: float) -> void:
	var node: Control = preload("res://scenes/battle_effects_ui/enemy_attack_hit_explosion.tscn").instantiate()
	node.offset_transform_position.x = x + randf_range(-20, 20)
	node.offset_transform_position.y = y + randf_range(-20, 20)
	container.add_child(node)
