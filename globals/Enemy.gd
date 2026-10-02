extends Node

const MAX_BUFF_TURNS: int = 9
const MAX_BUFF_VALUE: float = 1

signal enemy_hurt
signal enemy_defeated
var hp: int
var is_defending: bool
var has_absorb_barrier: bool
var has_reflect_barrier: bool
var attack_buff_turns: int
var attack_buff_value: float
var defense_buff_turns: int
var defense_buff_value: float

func get_max_hp() -> int:
	return 3000

func set_hp(new_hp: int) -> void:
	if new_hp > get_max_hp():
		hp = get_max_hp()
	elif new_hp < 0:
		hp = 0
	else:
		hp = new_hp

func affect_hp(new_hp: int) -> void:
	var old_hp = hp
	set_hp(new_hp)
	if hp < old_hp:
		Sfx.play_hit()
		enemy_hurt.emit()
	elif hp > old_hp:
		Sfx.play_heal()

func subtract_hp(value_hp: int) -> void:
	affect_hp(hp - value_hp)

func add_hp(value_hp: int) -> void:
	affect_hp(hp + value_hp)

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

func make_defend() -> void:
	is_defending = true

func on_turn_start() -> void:
	is_defending = false
	has_absorb_barrier = false
	has_reflect_barrier = false
	if attack_buff_turns > 0:
		attack_buff_turns -= 1
	if attack_buff_turns <= 0:
		attack_buff_value = 0
	if defense_buff_turns > 0:
		defense_buff_turns -= 1
	if defense_buff_turns <= 0:
		defense_buff_value = 0

func reset_enemy() -> void:
	set_hp(get_max_hp())
	is_defending = false
	has_absorb_barrier = false
	has_reflect_barrier = false
	attack_buff_turns = 0
	attack_buff_value = 0
	defense_buff_turns = 0
	defense_buff_value = 0

func get_stat_attack() -> int:
	return floori(2000 * (1 + attack_buff_value))

func get_stat_defense() -> int:
	return floori(500 * (1 + defense_buff_value))

func make_absorb_barrier() -> void:
	has_absorb_barrier = true

func make_reflect_barrier() -> void:
	has_reflect_barrier = true

func make_buff_attack() -> void:
	attack_buff_turns += 2
	if attack_buff_turns > MAX_BUFF_TURNS:
		attack_buff_turns = MAX_BUFF_TURNS
	attack_buff_value += 0.2
	if attack_buff_value > MAX_BUFF_VALUE:
		attack_buff_value = MAX_BUFF_VALUE

func make_buff_defense() -> void:
	defense_buff_turns += 2
	if defense_buff_turns > MAX_BUFF_TURNS:
		defense_buff_turns = MAX_BUFF_TURNS
	defense_buff_value += 0.2
	if defense_buff_value > MAX_BUFF_VALUE:
		defense_buff_value = MAX_BUFF_VALUE
