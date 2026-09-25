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
	var damage = DamageCalcs.get_modified_damage_to_enemy(1500)
	Enemy.subtract_hp(damage)
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + " takes " + str(damage) + " damage.",
		step_drain.bind(sender, damage),
		2.0
	)

func step_drain(sender: Sender, damage: int) -> void:
	if MagiciteDrainPlus.has_magicites():
		var healing: int = MagiciteDrainPlus.get_drain_healing(damage)
		Player.add_hp(healing)
		sender.send_timed(
			"Maria recovers " + str(healing) + " hp.",
			step_defeat.bind(sender),
			2.0
		)
	else:
		step_defeat(sender)

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
