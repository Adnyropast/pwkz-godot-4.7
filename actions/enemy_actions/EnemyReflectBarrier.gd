extends BaseAction

class_name EnemyReflectBarrier

func perform(sender: Sender) -> void:
	step_defend(sender)

func step_defend(sender: Sender) -> void:
	Enemy.make_reflect_barrier()
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + "'s Reflect Barrier!",
		step_end,
		2.0
	)
