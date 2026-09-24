extends BaseAction

class_name PlayerHeal

func perform(sender: Sender) -> void:
	step_heal(sender)

func step_heal(sender: Sender) -> void:
	sender.send_timed(
		"Maria heals!",
		step_recovery.bind(sender),
		2.0
	)

func step_recovery(sender: Sender) -> void:
	var healing: int = 1500
	Player.add_hp(healing)
	sender.send_timed(
		"Maria recovers " + str(healing) + " hp.",
		step_end,
		2.0
	)
