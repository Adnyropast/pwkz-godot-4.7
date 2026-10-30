extends Node

class_name EnemyDefeatActionStep

static func step_defeat(sender: Sender, step_next: Callable) -> void:
	if Enemy.is_ko():
		Enemy.try_emit_enemy_defeated()
		var enemy_name = Enemy.get_enemy_name()
		sender.send_timed(
			enemy_name + " was defeated!",
			step_next,
			2.0
		)
	else:
		step_next.call()
