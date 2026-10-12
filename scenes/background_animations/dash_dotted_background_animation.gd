extends Node3D

@onready var container: Node3D = $BackgroundDistance
var height_half: float = 10
var lanes_count: int = 24

func _ready() -> void:
	setup_lanes()

static func place_inline(min_x: float, max_x: float, index: float, count: float) -> float:
	return min_x + (index+1) / (count+1) * (max_x - min_x)

static func index_chevron(index: float, count: float) -> float:
	return 1 - absf(index - (count - 1) / 2) / ((count - 1) / 2)

func setup_lanes() -> void:
	for i in range(0, lanes_count):
		var node: Node3D = preload("res://scenes/background_animations/dash_dotted_background_animation_lane.tscn").instantiate()
		node.progression = 0.05 * index_chevron(i, lanes_count)
		node.position.y = place_inline(-height_half, height_half, i, lanes_count)
		container.add_child(node)
