extends BaseAction

class_name EnemyIdleFear

func perform(sender: Sender) -> void:
	sender.send_timed(
		Enemy.get_enemy_name() + " is shaking in fear.",
		step_end,
		2.0
	)
