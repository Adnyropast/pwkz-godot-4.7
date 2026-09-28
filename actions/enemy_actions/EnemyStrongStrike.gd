extends EnemyAttack

class_name EnemyStrongStrike

func perform(sender: Sender) -> void:
	step_attack(sender)

func step_attack(sender: Sender) -> void:
	var enemy_name = Enemy.get_enemy_name()
	sender.send_timed(
		enemy_name + "'s Strong Strike!",
		step_damage.bind(sender),
		2.0
	)

func step_damage(sender: Sender) -> void:
	var damage = DamageCalcs.get_base_damage_to_player()
	damage = floori(damage * 1.5)
	damage = DamageCalcs.get_modified_damage_to_player(damage)
	Player.subtract_hp(damage)
	var player_name = Player.get_player_name()
	var message: String
	if damage >= 0:
		message = player_name + " takes " + str(damage) + " damage."
	else:
		message = player_name + " recovers " + str(-damage) + " hp."
	sender.send_timed(
		message,
		step_reprisal.bind(sender, damage),
		2.0
	)
