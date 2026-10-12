extends Node3D

@onready var container: Node3D = $Container
const PROG_DURATION: float = 12
const PROG_RESET_VALUE: float = 1.2
var progression: float = 0
var width_half: float = 18
var dots_count: int = 40

func _ready() -> void:
	set_particles()

func _process(delta: float) -> void:
	progression += 1/PROG_DURATION * delta
	if progression >= PROG_RESET_VALUE:
		progression = 0
	update_particles()

static func place_inline(min_x: float, max_x: float, index: float, count: float) -> float:
	return min_x + (index+1) / (count+1) * (max_x - min_x)

func set_particles() -> void:
	for i in range(0, dots_count):
		var node: Node3D = preload("res://scenes/background_animations/background_animation_single_particle_dot.tscn").instantiate()
		node.position.x = place_inline(width_half, -width_half, i, dots_count)
		container.add_child(node)

func update_particles() -> void:
	for i in range(0, dots_count):
		var progression_destination: float = progression * (dots_count + 2)
		var progression_source: float = i + 1
		var distance: float = progression_destination - progression_source
		var opacity: float
		if distance < 0:
			opacity = -distance
			opacity = opacity / 0.5
			opacity = 1 - opacity
		else:
			opacity = distance
			opacity = opacity / 8
			opacity = 1 - opacity
		opacity = minf(1, opacity)
		opacity = maxf(0.0, opacity)
		container.get_child(i).set_opacity(opacity)
