extends Node

class_name EnemiesActions

static var ENEMIES_ACTIONS: Array = [
	[EnemyAttack, EnemyIdleFear],
	[EnemyAttack, EnemyDefend, EnemyIdleDance],
	[EnemyAttack, EnemyIdleDance, EnemyBuffAttack],
	[EnemyAttack, EnemyHeal, EnemyIdleDance],
	[EnemyAttack, EnemyBuffAttack, EnemyIdleObserve],
	[EnemyAttack, EnemyDefend, EnemyHeal],
	[EnemyAttack, EnemyIdleObserve, EnemyHeal],
	[EnemyAttack, EnemyStrongStrike, EnemyIdleStare],
	[EnemyAttack, EnemyDrainHP, EnemyIdleObserve],
	[EnemyAttack, EnemyAbsorbBarrier, EnemyHeal, EnemyIdleDance],
	[EnemyAttack, EnemyReflectBarrier, EnemyBuffDefense],
	[EnemyAttack, EnemyDrainHP, EnemyBuffAttack],
	
	[EnemyAttack, EnemyStrongStrike, EnemyIdleObserve],
	[EnemyAttack, EnemyDrainHP, EnemyDefend, EnemyHeal],
	[EnemyAttack, EnemyAbsorbBarrier, EnemyReflectBarrier, EnemyIdleStare],
	[EnemyAttack, EnemyBuffAttack, EnemyIdleObserve],
	[EnemyAttack, EnemyStrongStrike, EnemyBuffAttack, EnemyIdleStare],
	[EnemyAttack, EnemyBuffDefense, EnemyDefend, EnemyBuffAttack],
	[EnemyAttack, EnemyEdgeOfDeath, EnemyBuffAttack, EnemyDefend],
	[EnemyAttack, EnemyEdgeOfDeath, EnemyDefend, EnemyStrongStrike],
]

static func convert_enemy_id(id: int) -> int:
	if id > 20:
		id = id - (21 - (12 + 1))
	
	return id - 1

static func get_enemy_actions(id: int) -> Array:
	return ENEMIES_ACTIONS[convert_enemy_id(id)]
