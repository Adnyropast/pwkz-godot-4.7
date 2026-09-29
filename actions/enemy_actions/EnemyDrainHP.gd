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
	Player.subtract_hp(damage)
	var player_name = Player.get_player_name()
	var message: String
	if damage >= 0:
		message = player_name + " takes " + str(damage) + " damage."
		Player.portrait_set_hurt()
	else:
		message = player_name + " recovers " + str(-damage) + " hp."
	sender.send_timed(
		message,
		step_reprisal.bind(sender, damage),
		2.0
	)

func step_reprisal(sender: Sender, damage: int) -> void:
	Player.portrait_stop_hurt()
	
	var value: int = 0
	
	if Player.has_reprisal():
		var reprisal_damage = MagiciteReprisalPlus.get_reprisal_damage(damage)
		reprisal_damage = DamageCalcs.get_modified_damage_to_enemy(reprisal_damage)
		value += reprisal_damage
	
	value -= damage
	
	Enemy.subtract_hp(value)
	var enemy_name = Enemy.get_enemy_name()
	var message: String
	if value > 0:
		message = enemy_name + " takes " + str(value) + " damage back!"
	else:
		message = enemy_name + " recovers " + str(-value) + " hp."
	sender.send_timed(
		message,
		step_self_defeat.bind(sender),
		2.0
	)
