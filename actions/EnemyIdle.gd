extends BaseAction

class_name EnemyIdle

func perform(sender: Sender) -> void:
	sender.send_timed(
		Enemies.get_enemy_name(WorldState.get_phase_enemy_id()) + " is standing by.",
		step_end,
		2.0
	)
