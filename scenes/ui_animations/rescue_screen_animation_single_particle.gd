extends Control

@onready var speed_node: Control = $Speed
@onready var texture_rect: TextureRect = $Speed/Opacity/Transparent/TextureRect
var speed: Vector2

func _ready() -> void:
	texture_rect.texture = WorldConstants.get_world_shape(WorldState.current_world)
	var tween: Tween = create_tween()
	tween.tween_callback(queue_free).set_delay(3.0)

func _process(delta: float) -> void:
	speed = speed * pow(1 / 1.001, 60 * delta)
	speed_node.position += speed
