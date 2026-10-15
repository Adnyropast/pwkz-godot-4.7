extends Node

class_name BattleEffects

static func make_player_attack_strike() -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/player_attack_strike.tscn").instantiate()
	Engine.get_main_loop().root.add_child(node)

static func make_player_attack_hit() -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/player_attack_hit.tscn").instantiate()
	Engine.get_main_loop().root.add_child(node)

static func make_player_defend_shield() -> void:
	var node: Control = preload("res://scenes/battle_effects_ui/player_defend_shield.tscn").instantiate()
	PlayerHUD.current.player_texture_container.add_child(node)

static func make_player_heal_circle() -> void:
	var node: Control = preload("res://scenes/battle_effects_ui/player_heal_circle.tscn").instantiate()
	PlayerHUD.current.player_texture_container.add_child(node)

static func make_player_heal_sparkles() -> void:
	var node: Control = preload("res://scenes/battle_effects_ui/player_heal_sparkles.tscn").instantiate()
	PlayerHUD.current.player_texture_container.add_child(node)

static func make_enemy_attack_hit() -> void:
	var node: Control = preload("res://scenes/battle_effects_ui/enemy_attack_hit.tscn").instantiate()
	PlayerHUD.current.player_texture_container.add_child(node)

static func make_enemy_defend_shield() -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/enemy_defend_shield.tscn").instantiate()
	Engine.get_main_loop().root.add_child(node)

static func make_enemy_defend_shield_absorb() -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/enemy_defend_shield.tscn").instantiate()
	Engine.get_main_loop().root.add_child(node)
	node.make_absorb_barrier()

static func make_enemy_defend_shield_reflect() -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/enemy_defend_shield.tscn").instantiate()
	Engine.get_main_loop().root.add_child(node)
	node.make_reflect_barrier()

static func make_enemy_heal_sparkles() -> void:
	var node: Node3D = preload("res://scenes/battle_effects_3d/enemy_heal_sparkles.tscn").instantiate()
	Engine.get_main_loop().root.add_child(node)
