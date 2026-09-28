extends BaseAction

class_name EnemyIdleDance

func perform(sender: Sender) -> void:
	sender.send_timed(
		Enemy.get_enemy_name() + " started a little dance!",
		step_nothing_happened.bind(sender),
		2.0
	)

func step_nothing_happened(sender: Sender) -> void:
	sender.send_timed(
		"But nothing happened.",
		step_end,
		2.0
	)
