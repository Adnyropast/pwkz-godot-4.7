extends Node3D

@onready var opacity_node: Sprite3D = $Opacity
@onready var sprite: Sprite3D = $Opacity/Sprite3D

func _ready() -> void:
	sprite.texture = WorldConstants.get_world_shape(WorldState.current_world)

func set_opacity(opacity: float) -> void:
	opacity_node.modulate.a = opacity
