extends Node

signal enemy_defeated
var hp: int

func reset_hp() -> void:
	hp = 3000

func subtract_hp(value_hp: int) -> void:
	hp -= value_hp

func get_id() -> int:
	var current_world: int = WorldState.current_world
	var current_stage: int = WorldState.current_stage
	var current_phase: int = WorldState.current_phase
	return WorldConstants.PHASES[current_world - 1][current_stage - 1][current_phase]

func get_enemy_name() -> String:
	return Enemies.get_enemy_name(get_id())

func get_texture() -> Texture:
	return Enemies.get_enemy_texture(get_id())

func is_ko() -> bool:
	return hp <= 0

func try_emit_enemy_defeated() -> void:
	if is_ko():
		enemy_defeated.emit()
