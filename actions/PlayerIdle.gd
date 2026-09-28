extends BaseAction

class_name PlayerIdle

func perform(sender: Sender) -> void:
	var player_name = Player.get_player_name()
	sender.send_timed(
		player_name + " is standing by.",
		step_end,
		2.0
	)
