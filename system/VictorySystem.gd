extends Node

class_name VictorySystem

static func check_victory() -> bool:
	return Enemy.hp <= 0
