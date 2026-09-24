extends BaseAction

class_name PlayerDefend

func perform(sender: Sender) -> void:
	step_defend(sender)

func step_defend(sender: Sender) -> void:
	Player.make_defend()
	sender.send_timed(
		"Maria defends!",
		step_end,
		2.0
	)
