extends Node

class_name PlayerDefeatActionStep

static func step_defeat(sender: Sender, step_next: Callable) -> void:
	if Player.is_ko():
		if Player.has_revive():
			PlayerReviveActionStep.step_revive(sender, step_next)
		else:
			Player.try_emit_player_defeated()
			var player_name = Player.get_player_name()
			sender.send_timed(
				player_name + " was defeated!",
				step_next,
				2.0
			)
	else:
		step_next.call()
