extends Resource

class_name Magicite

enum MagiciteType {
	ATTACK,
	DEFEND,
	HEAL,
	STATUS
}

@export var name: String
@export var type: MagiciteType

func get_texture() -> Texture:
	if type == MagiciteType.ATTACK:
		return preload("res://images/magicites/mt1.png")
	elif type == MagiciteType.DEFEND:
		return preload("res://images/magicites/mt2.png")
	elif type == MagiciteType.HEAL:
		return preload("res://images/magicites/mt3.png")
	elif type == MagiciteType.STATUS:
		return preload("res://images/magicites/mt4.png")
	return null
