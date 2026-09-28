extends BaseAction

class_name EnemyAbsorbBarrier

func perform(sender: Sender) -> void:
	step_defend(sender)

func step_defend(sender: Sender) -> void:
	Enemy.make_absorb_barrier()
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + "'s Absorb Barrier!",
		step_end,
		2.0
	)
