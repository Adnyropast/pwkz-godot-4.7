extends BaseAction

class_name PlayerAttack

func perform(sender: Sender) -> void:
	step_attack(sender)

func step_attack(sender: Sender) -> void:
	sender.send_timed(
		"Maria attacks!",
		step_damage.bind(sender),
		2.0
	)

func step_damage(sender: Sender) -> void:
	var damage = 1500
	Enemy.subtract_hp(damage)
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + " takes " + str(damage) + " damage.",
		step_defeat.bind(sender),
		2.0
	)

func step_defeat(sender: Sender) -> void:
	if Enemy.is_ko():
		Enemy.try_emit_enemy_defeated()
		var enemy_name = Enemy.get_enemy_name()
		sender.send_timed(
			enemy_name + " was defeated!",
			step_end,
			2.0
		)
	else:
		step_end()
