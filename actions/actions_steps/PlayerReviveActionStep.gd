extends Node

class_name PlayerReviveActionStep

static func step_revive(sender: Sender, step_next: Callable) -> void:
	Player.portrait_stop_hurt()
	var healing: int = 1500
	healing = MagiciteHealPlus.get_modified_healing(healing)
	healing = HealingCalcs.get_healing_roll_modified_healing(healing)
	Player.set_hp(healing)
	BattleEffects.make_player_heal_sparkles()
	var player_name = Player.get_player_name()
	sender.send_timed(
		"But " + player_name + " was revived!",
		step_next,
		2.0
	)
