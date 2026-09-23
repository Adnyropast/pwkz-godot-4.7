extends BaseAction

class_name EnemyIdle

func perform(sender: Sender) -> void:
	sender.send_timed(
		Enemy.get_enemy_name() + " is standing by.",
		step_end,
		2.0
	)
