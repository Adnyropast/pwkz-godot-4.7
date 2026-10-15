extends Node3D

@onready var color_node: Sprite3D = $ForegroundDistance/Scale/Opacity/Color

func make_absorb_barrier() -> void:
	color_node.modulate = Color.html("#01FF06")

func make_reflect_barrier() -> void:
	color_node.modulate = Color.html("#9C01FF")
