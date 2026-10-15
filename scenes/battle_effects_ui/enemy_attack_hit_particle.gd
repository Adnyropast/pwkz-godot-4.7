extends Control

@onready var speed_node: Control = $Speed
@onready var texture_rect: TextureRect = $Speed/Opacity/TextureRect
var speed: Vector2

func _ready() -> void:
	texture_rect.texture = WorldConstants.get_world_shape(WorldState.current_world)

func _process(delta: float) -> void:
	speed = speed * pow(1 / 1.05, 60 * delta)
	speed_node.offset_transform_position += speed
