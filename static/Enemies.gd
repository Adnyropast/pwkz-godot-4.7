extends Node

class_name Enemies

const ENEMIES_TEXTURES: Array[Texture] = [
	preload("res://images/enemies/e01.png"),
	preload("res://images/enemies/e02.png"),
	preload("res://images/enemies/e03.png"),
	preload("res://images/enemies/e04.png"),
	preload("res://images/enemies/e05.png"),
	preload("res://images/enemies/e06.png"),
	preload("res://images/enemies/e07.png"),
	preload("res://images/enemies/e08.png"),
	preload("res://images/enemies/e09.png"),
	preload("res://images/enemies/e10.png"),
	preload("res://images/enemies/e11.png"),
	preload("res://images/enemies/e12.png"),
	preload("res://images/enemies/e21.png"),
	preload("res://images/enemies/e22.png"),
	preload("res://images/enemies/e23.png"),
	preload("res://images/enemies/e24.png"),
	preload("res://images/enemies/e25.png"),
	preload("res://images/enemies/e26.png"),
	preload("res://images/enemies/e27.png"),
	preload("res://images/enemies/e28.png"),
]

static func get_enemy_texture(id: int) -> Texture:
	if id > 20:
		id = id - (21 - (12 + 1))
	
	return ENEMIES_TEXTURES[id - 1]
