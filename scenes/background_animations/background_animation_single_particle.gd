extends Node3D

@onready var sprite: Sprite3D = $FadeIn/Sprite3D

func _ready() -> void:
	sprite.texture = WorldConstants.get_world_shape_white(WorldState.current_world)
	sprite.modulate = WorldColors.get_arena_shape_color(WorldState.current_world)
	sprite.modulate.a = 191/256.0
