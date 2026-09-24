extends Node

signal enemy_defeated
var hp: int

func get_max_hp() -> int:
	return 3000

func set_hp(new_hp: int) -> void:
	if new_hp > get_max_hp():
		hp = get_max_hp()
	elif new_hp < 0:
		hp = 0
	else:
		hp = new_hp

func reset_hp() -> void:
	set_hp(get_max_hp())

func subtract_hp(value_hp: int) -> void:
	set_hp(hp - value_hp)

func add_hp(value_hp: int) -> void:
	set_hp(hp + value_hp)

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
