extends Node3D

@onready var speed_node: Node3D = $Speed
@onready var sprite: Sprite3D = $Speed/Opacity/Sprite3D
var speed: Vector3

func _ready() -> void:
	sprite.texture = WorldConstants.get_world_shape(WorldState.current_world)

func _process(delta: float) -> void:
	speed = speed * pow(1 / 1.05, 60 * delta)
	speed_node.position += speed
