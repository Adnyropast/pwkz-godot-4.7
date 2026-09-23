extends Node

class_name DefeatSystem

static func check_defeat() -> bool:
	return Player.hp <= 0
