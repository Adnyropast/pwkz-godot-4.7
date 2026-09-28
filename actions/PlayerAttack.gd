extends BaseAction

class_name PlayerAttack

func perform(sender: Sender) -> void:
	step_attack(sender)

func step_attack(sender: Sender) -> void:
	var player_name = Player.get_player_name()
	sender.send_timed(
		player_name + " attacks!",
		step_instant_ko.bind(sender),
		2.0
	)

func step_instant_ko(sender: Sender) -> void:
	if MagiciteInstantKOPlus.roll_instant_ko():
		var damage = Enemy.hp
		Enemy.subtract_hp(damage)
		Player.make_attack()
		sender.send_timed(
			"Instant K.O.!!!",
			step_drain.bind(sender, damage),
			2.0
		)
	else:
		step_damage(sender)

func step_damage(sender: Sender) -> void:
	var damage = DamageCalcs.get_base_damage_to_enemy()
	damage = DamageCalcs.get_modified_damage_to_enemy(damage)
	Enemy.subtract_hp(damage)
	Player.make_attack()
	var enemy_name = Enemy.get_enemy_name()
	var message: String
	if damage >= 0:
		message = enemy_name + " takes " + str(damage) + " damage."
	else:
		message = enemy_name + " recovers " + str(-damage) + " hp."
	sender.send_timed(
		message,
		step_drain.bind(sender, damage),
		2.0
	)

func step_drain(sender: Sender, damage: int) -> void:
	if MagiciteDrainPlus.has_magicites() or Enemy.has_reflect_barrier:
		var value: int = DamageCalcs.get_reprisal_drain_to_player(damage)
		Player.subtract_hp(value)
		var player_name = Player.get_player_name()
		var message: String
		if value >= 0:
			message = player_name + " takes " + str(value) + " damage."
		else:
			message = player_name + " recovers " + str(-value) + " hp."
		sender.send_timed(
			message,
			step_self_defeat.bind(sender),
			2.0
		)
	else:
		step_defeat(sender)

func step_self_defeat(sender: Sender) -> void:
	if Player.is_ko():
		if Player.has_revive():
			step_revive(sender)
		else:
			Player.try_emit_player_defeated()
			var player_name = Player.get_player_name()
			sender.send_timed(
				player_name + " was defeated!",
				step_defeat.bind(sender),
				2.0
			)
	else:
		step_defeat(sender)

func step_revive(sender: Sender) -> void:
	var healing: int = 1500
	healing = MagiciteHealPlus.get_modified_healing(healing)
	Player.set_hp(healing)
	var player_name = Player.get_player_name()
	sender.send_timed(
		"But " + player_name + " was revived!",
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
