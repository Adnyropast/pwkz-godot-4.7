extends Node

class_name EnemyDrainActionStep

static func step_drain(sender: Sender, step_next: Callable, damage: int, drain_damage: bool) -> void:
	if drain_damage or Player.has_reprisal():
		var value: int = 0
		
		if Player.has_reprisal():
			var reprisal_damage = MagiciteReprisalPlus.get_reprisal_damage(damage)
			reprisal_damage = DamageCalcs.get_modified_damage_to_enemy(reprisal_damage)
			value += reprisal_damage
		
		if drain_damage:
			value -= damage
		
		Enemy.subtract_hp(value)
		var enemy_name = Enemy.get_enemy_name()
		var message: String
		if value > 0 or (value == 0 and not drain_damage):
			message = enemy_name + " takes " + str(value) + " damage back!"
		else:
			message = enemy_name + " recovers " + str(-value) + " hp."
			BattleEffects.make_enemy_heal_sparkles()
		sender.send_timed(
			message,
			EnemyDefeatActionStep.step_defeat.bind(sender, step_next),
			2.0
		)
	else:
		step_next.call()
