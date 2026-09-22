extends BaseAction

class_name PlayerIdle

func perform(sender: Sender) -> void:
	sender.send_timed(
		"Maria is standing by.",
		step_end,
		2.0
	)
