extends Node3D

@onready var container: Node3D = $BackgroundDistance/GroundLevel
var divider: int = 3
var divider_offset: int = 0

static func place_inline(min_x: float, max_x: float, index: float, count: float) -> float:
	return min_x + (index+1) / (count+1) * (max_x - min_x)

func create_waves() -> void:
	var count: int = 12
	for i in range(0, count):
		if (i - divider_offset) % divider == 0:
			var offset: float = place_inline(-20, 20, i, count)
			create_wave(offset)
	divider_offset = (divider_offset + 1) % divider

func create_wave(offset: float) -> void:
	var node: Node3D = preload("res://scenes/background_animations/wave_up_background_animation_wave.tscn").instantiate()
	node.position.x = offset
	container.add_child(node)
