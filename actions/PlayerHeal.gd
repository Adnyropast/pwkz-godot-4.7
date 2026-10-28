extends BaseAction

class_name PlayerHeal

func perform(sender: Sender) -> void:
	step_heal(sender)

func step_heal(sender: Sender) -> void:
	BattleEffects.make_player_heal_circle()
	var player_name = Player.get_player_name()
	sender.send_timed(
		player_name + " heals!",
		step_recovery.bind(sender),
		2.0
	)

func step_recovery(sender: Sender) -> void:
	var healing: int = 1500
	healing = MagiciteHealPlus.get_modified_healing(healing)
	healing = HealingCalcs.get_healing_roll_modified_healing(healing)
	Player.add_hp(healing)
	Player.make_heal()
	BattleEffects.make_player_heal_sparkles()
	var player_name = Player.get_player_name()
	sender.send_timed(
		player_name + " recovers " + str(healing) + " hp.",
		step_end,
		2.0
	)
