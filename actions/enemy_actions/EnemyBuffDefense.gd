extends BaseAction

class_name EnemyBuffDefense

func perform(sender: Sender) -> void:
	step_buff(sender)

func step_buff(sender: Sender) -> void:
	Enemy.make_buff_defense()
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + "'s Buff Defense!",
		step_end,
		2.0
	)
