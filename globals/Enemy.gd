extends Node

var hp: int

func reset_hp() -> void:
	hp = 3000

func get_id() -> int:
	var current_world: int = WorldState.current_world
	var current_stage: int = WorldState.current_stage
	var current_phase: int = WorldState.current_phase
	return WorldConstants.PHASES[current_world - 1][current_stage - 1][current_phase]

func get_enemy_name() -> String:
	return Enemies.get_enemy_name(get_id())

func get_texture() -> Texture:
	return Enemies.get_enemy_texture(get_id())
