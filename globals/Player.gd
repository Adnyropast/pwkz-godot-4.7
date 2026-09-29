extends Node

const MAX_HP = 3000
const MAX_BUFF_TURNS: int = 9
const MAX_BUFF_VALUE: float = 1

signal player_defeated
signal hp_changed
signal statuses_changed
signal portrait_changed
var hp: int
var defending_turns: int
var enduring_turns: int
var reprisal_turns: int
var revive_turns: int
var attack_buff_turns: int
var attack_buff_value: float
var defense_buff_turns: int
var defense_buff_value: float
var player_mode: Players.Modes
var portrait_is_attacking: bool
var portrait_is_hurt: bool

func get_player_name() -> String:
	return Players.get_player_name(player_mode)

func get_player_texture() -> Texture:
	if Player.portrait_is_hurt:
		return Players.get_player_texture_hurt(player_mode)
	elif Player.portrait_is_attacking:
		return Players.get_player_texture_attacking(player_mode)
	else:
		return Players.get_player_texture(player_mode)

func set_hp(new_hp: int) -> void:
	if new_hp > MAX_HP:
		hp = MAX_HP
	elif new_hp < 0:
		hp = 0
	else:
		hp = new_hp
	hp_changed.emit()

func subtract_hp(value_hp: int) -> void:
	set_hp(hp - value_hp)

func add_hp(value_hp) -> void:
	set_hp(hp + value_hp)

func is_ko() -> int:
	return hp <= 0

func try_emit_player_defeated() -> void:
	if is_ko():
		player_defeated.emit()

func make_defend() -> void:
	defending_turns = MagiciteTurnsPlus.get_defending_turns()
	enduring_turns = MagiciteEndurePlus.get_enduring_turns()
	reprisal_turns = MagiciteReprisalPlus.get_reprisal_turns()
	buff_attack(MagiciteAttackPlus.get_buff_turns_from_defend(), MagiciteAttackPlus.get_buff_value_from_defend())
	buff_defense(MagiciteDefensePlus.get_buff_turns_from_defend(), MagiciteDefensePlus.get_buff_value_from_defend())
	statuses_changed.emit()

func on_turn_start() -> void:
	if defending_turns > 0:
		defending_turns -= 1
	if enduring_turns > 0:
		enduring_turns -= 1
	if reprisal_turns > 0:
		reprisal_turns -= 1
	if revive_turns > 0:
		revive_turns -= 1
	if attack_buff_turns > 0:
		attack_buff_turns -= 1
	if attack_buff_turns <= 0:
		attack_buff_value = 0
	if defense_buff_turns > 0:
		defense_buff_turns -= 1
	if defense_buff_turns <= 0:
		defense_buff_value = 0
	statuses_changed.emit()

func is_defending() -> bool:
	return defending_turns > 0

func is_enduring() -> bool:
	return enduring_turns > 0

func has_reprisal() -> bool:
	return reprisal_turns > 0

func make_heal() -> void:
	revive_turns = MagiciteRevivePlus.get_revive_turns()
	buff_attack(MagiciteAttackPlus.get_buff_turns_from_heal(), MagiciteAttackPlus.get_buff_value_from_heal())
	buff_defense(MagiciteDefensePlus.get_buff_turns_from_heal(), MagiciteDefensePlus.get_buff_value_from_heal())
	statuses_changed.emit()

func has_revive() -> bool:
	return revive_turns > 0

func make_attack() -> void:
	buff_attack(MagiciteAttackPlus.get_buff_turns_from_attack(), MagiciteAttackPlus.get_buff_value_from_attack())
	buff_defense(MagiciteDefensePlus.get_buff_turns_from_attack(), MagiciteDefensePlus.get_buff_value_from_attack())
	statuses_changed.emit()

func buff_attack(turns: int, value: float) -> void:
	attack_buff_turns += turns
	if attack_buff_turns > MAX_BUFF_TURNS:
		attack_buff_turns = MAX_BUFF_TURNS
	attack_buff_value += value
	if attack_buff_value > MAX_BUFF_VALUE:
		attack_buff_value = MAX_BUFF_VALUE

func buff_defense(turns: int, value: float) -> void:
	defense_buff_turns += turns
	if defense_buff_turns > MAX_BUFF_TURNS:
		defense_buff_turns = MAX_BUFF_TURNS
	defense_buff_value += value
	if defense_buff_value > MAX_BUFF_VALUE:
		defense_buff_value = MAX_BUFF_VALUE

func has_attack_buff() -> bool:
	return attack_buff_turns > 0

func get_stat_attack() -> int:
	return floori(2000 * (1 + attack_buff_value))

func has_defense_buff() -> bool:
	return defense_buff_turns > 0

func get_stat_defense() -> int:
	return floori(1000 * (1 + defense_buff_value))

func reset_player() -> void:
	set_hp(MAX_HP)
	defending_turns = 0
	enduring_turns = 0
	reprisal_turns = 0
	revive_turns = 0
	attack_buff_turns = 0
	attack_buff_value = 0
	defense_buff_turns = 0
	defense_buff_value = 0

func portrait_set_attacking() -> void:
	portrait_is_attacking = true
	portrait_changed.emit()

func portrait_stop_attacking() -> void:
	portrait_is_attacking = false
	portrait_changed.emit()

func portrait_set_hurt() -> void:
	portrait_is_hurt = true
	portrait_changed.emit()

func portrait_stop_hurt() -> void:
	portrait_is_hurt = false
	portrait_changed.emit()
