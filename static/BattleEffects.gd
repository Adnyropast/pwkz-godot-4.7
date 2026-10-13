extends Node

class_name BattleEffects

static func make_player_attack_strike() -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/player_attack_strike.tscn").instantiate()
	Engine.get_main_loop().root.add_child(node)

static func make_player_attack_hit() -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/player_attack_hit.tscn").instantiate()
	Engine.get_main_loop().root.add_child(node)
