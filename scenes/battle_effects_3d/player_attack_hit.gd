extends Node3D

@onready var container: Node3D = $ForegroundDistance

func _ready() -> void:
	delay_explosion(0.0, 1, 1)
	delay_explosion(0.2, -1, 0)
	delay_explosion(0.4, 0, -1)
	var tween: Tween = create_tween()
	tween.tween_callback(queue_free).set_delay(2.0)

func delay_explosion(delay: float, x: float, y: float) -> void:
	var tween: Tween = create_tween()
	tween.tween_callback(make_explosion.bind(x, y)).set_delay(delay)

func make_explosion(x: float, y: float) -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/player_attack_hit_explosion.tscn").instantiate()
	node.position.x = x
	node.position.y = y
	container.add_child(node)
