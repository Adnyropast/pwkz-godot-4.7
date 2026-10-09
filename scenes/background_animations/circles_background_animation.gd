extends Node3D

@onready var container: Node3D = $BackgroundDistance

func _ready() -> void:
	for i in range(0, 8):
		create_spinner(i)

func create_spinner(index: int) -> void:
	var node: Node3D = preload("res://scenes/background_animations/circles_background_animation_spinner.tscn").instantiate()
	node.length = (2 + index) * 10
	node.radius = 4 + index * 2
	node.counter_clockwise = index % 2 == 0
	container.add_child(node)
