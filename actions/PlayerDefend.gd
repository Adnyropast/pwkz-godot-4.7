extends BaseAction

class_name PlayerDefend

func perform(sender: Sender) -> void:
	step_defend(sender)

func step_defend(sender: Sender) -> void:
	Player.make_defend()
	BattleEffects.make_player_defend_shield()
	var player_name = Player.get_player_name()
	sender.send_timed(
		player_name + " defends!",
		step_end,
		2.0
	)
