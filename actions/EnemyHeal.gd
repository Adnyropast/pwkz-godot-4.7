extends BaseAction

class_name EnemyHeal

func perform(sender: Sender) -> void:
	step_heal(sender)

func step_heal(sender: Sender) -> void:
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + " tries to heal!",
		step_recovery.bind(sender),
		2.0
	)

func step_recovery(sender: Sender) -> void:
	var healing_chance: int = 50
	if randi_range(0, 99) < healing_chance:
		var healing: int = 500
		Enemy.add_hp(healing)
		var enemy_name = Enemy.get_enemy_name()
		sender.send_timed(
			enemy_name + " recovers " + str(healing) + " hp.",
			step_end,
			2.0
		)
	else:
		sender.send_timed(
			"But it failed!",
			step_end,
			2.0
		)
