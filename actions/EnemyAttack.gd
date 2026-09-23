extends BaseAction

class_name EnemyAttack

func perform(sender: Sender) -> void:
	step_attack(sender)

func step_attack(sender: Sender) -> void:
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + " attacks!",
		step_damage.bind(sender),
		2.0
	)

func step_damage(sender: Sender) -> void:
	var damage = 1000
	Player.subtract_hp(damage)
	sender.send_timed(
		"Maria takes " + str(damage) + " damage.",
		step_defeat.bind(sender),
		2.0
	)

func step_defeat(sender: Sender) -> void:
	if Player.is_ko():
		Player.try_emit_player_defeated()
		sender.send_timed(
			"Maria was defeated!",
			step_end,
			2.0
		)
	else:
		step_end()
