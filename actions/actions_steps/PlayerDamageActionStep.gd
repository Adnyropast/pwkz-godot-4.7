extends Node

class_name PlayerDamageActionStep

static func step_damage(sender: Sender, step_next: Callable, damage: int, damage_drain: bool) -> void:
	Player.subtract_hp(damage)
	BattleEffects.make_enemy_attack_hit()
	var player_name = Player.get_player_name()
	var message: String
	if damage >= 0:
		message = player_name + " takes " + str(damage) + " damage."
		Player.portrait_set_hurt()
	else:
		message = player_name + " recovers " + str(-damage) + " hp."
	sender.send_timed(
		message,
		EnemyDrainActionStep.step_drain.bind(
			sender, PlayerDefeatActionStep.step_defeat.bind(
				sender,
				step_damage_end.bind(step_next)
			),
			damage, damage_drain
		),
		2.0
	)

static func step_damage_end(step_next: Callable) -> void:
	Player.portrait_stop_hurt()
	step_next.call()
