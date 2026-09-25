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

const ENEMIES_NAMES: Array[String] = [
	"Slime",
	"Goblin Swordsman",
	"Goblin Chopper",
	"Goblin Archer",
	"Wolf",
	"Orc",
	"Softpuff",
	"Land Shark",
	"Spider",
	"Flower Pot",
	"Lantern",
	"Wraith",
	"White Cyclops",
	"Noble Moth",
	"Maw Flower",
	"Blue Taurus",
	"Giant Rooster",
	"Cursed Doll",
	"Space Dragon",
	"Demon Tide",
]

static func convert_enemy_id(id: int) -> int:
	if id > 20:
		id = id - (21 - (12 + 1))
	
	return id - 1

static func get_enemy_texture(id: int) -> Texture:
	return ENEMIES_TEXTURES[convert_enemy_id(id)]

static func get_enemy_name(id: int) -> String:
	return ENEMIES_NAMES[convert_enemy_id(id)]
