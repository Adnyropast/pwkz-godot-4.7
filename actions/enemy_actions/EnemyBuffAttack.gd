extends BaseAction

class_name EnemyBuffAttack

func perform(sender: Sender) -> void:
	step_buff(sender)

func step_buff(sender: Sender) -> void:
	Enemy.make_buff_attack()
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + "'s Buff Attack!",
		step_end,
		2.0
	)
