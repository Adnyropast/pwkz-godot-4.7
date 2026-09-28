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
	var damage = DamageCalcs.get_modified_damage_to_player(1000)
	Player.subtract_hp(damage)
	var message: String
	if damage >= 0:
		message = "Maria takes " + str(damage) + " damage."
	else:
		message = "Maria recovers " + str(-damage) + " hp."
	sender.send_timed(
		message,
		step_reprisal.bind(sender, damage),
		2.0
	)

func step_reprisal(sender: Sender, damage: int) -> void:
	if Player.has_reprisal():
		var reprisal_damage = MagiciteReprisalPlus.get_reprisal_damage(damage)
		reprisal_damage = DamageCalcs.get_modified_damage_to_enemy(reprisal_damage)
		Enemy.subtract_hp(reprisal_damage)
		var enemy_name = Enemy.get_enemy_name()
		sender.send_timed(
			enemy_name + " takes " + str(reprisal_damage) + " damage back!",
			step_self_defeat.bind(sender),
			2.0
		)
	else:
		step_defeat(sender)

func step_self_defeat(sender: Sender) -> void:
	if Enemy.is_ko():
		Enemy.try_emit_enemy_defeated()
		var enemy_name = Enemy.get_enemy_name()
		sender.send_timed(
			enemy_name + " was defeated!",
			step_defeat.bind(sender),
			2.0
		)
	else:
		step_defeat(sender)

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
