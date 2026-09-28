extends BaseAction

class_name EnemyIdleObserve

func perform(sender: Sender) -> void:
	sender.send_timed(
		Enemy.get_enemy_name() + " is observing carefully.",
		step_end,
		2.0
	)
