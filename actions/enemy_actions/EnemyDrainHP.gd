extends EnemyAttack

class_name EnemyDrainHP

func perform(sender: Sender) -> void:
	step_attack(sender)

func step_attack(sender: Sender) -> void:
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + "'s Drain HP!",
		step_damage.bind(sender),
		2.0
	)

func step_damage(sender: Sender) -> void:
	var damage = DamageCalcs.get_base_damage_to_player()
	damage = floori(damage * 0.5)
	damage = DamageCalcs.get_modified_damage_to_player(damage)
	damage = DamageCalcs.get_damage_roll_modified_damage(damage)
	damage = DamageCalcs.get_player_endure_modified_damage(damage)
	PlayerDamageActionStep.step_damage(sender, step_end, damage, true)
