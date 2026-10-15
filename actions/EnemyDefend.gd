extends BaseAction

class_name EnemyDefend

func perform(sender: Sender) -> void:
	step_defend(sender)

func step_defend(sender: Sender) -> void:
	Enemy.make_defend()
	BattleEffects.make_enemy_defend_shield()
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + " defends!",
		step_end,
		2.0
	)
