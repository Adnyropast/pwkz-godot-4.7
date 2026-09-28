extends BaseAction

class_name EnemyIdleStare

func perform(sender: Sender) -> void:
	sender.send_timed(
		Enemy.get_enemy_name() + " is staring menacingly.",
		step_end,
		2.0
	)
