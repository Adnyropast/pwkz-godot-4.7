extends Node

const PRINCES_NAMES: Array = [
	"Princess Clara",
	"Prince Grant",
	"Princess Lima",
	"Prince Skyler",
	"Princess Berie",
	"Prince Pastor",
	"Princess Jennie",
	"Prince Maeve",
]

const PRINCES_TEXTURES: Array = [
	preload("res://images/princes/s1.png"),
	preload("res://images/princes/s2.png"),
	preload("res://images/princes/s3.png"),
	preload("res://images/princes/s4.png"),
	preload("res://images/princes/s5.png"),
	preload("res://images/princes/s6.png"),
	preload("res://images/princes/s7.png"),
	preload("res://images/princes/s8.png"),
]

func get_prince_name(world: int) -> String:
	return PRINCES_NAMES[world - 1]

func get_prince_texture(world: int) -> Texture:
	return PRINCES_TEXTURES[world - 1]
