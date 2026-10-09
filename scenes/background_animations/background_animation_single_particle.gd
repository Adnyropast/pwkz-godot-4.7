extends Node3D

@onready var sprite: Sprite3D = $Sprite3D

func _ready() -> void:
	sprite.texture = WorldConstants.get_world_shape(WorldState.current_world)
