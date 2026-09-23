extends Node

class_name EnemyActionPicker

static func pick_action(sender: Sender, on_ended: Callable) -> void:
	var action: BaseAction = get_random_action()
	action.ended.connect(on_ended)
	action.perform(sender)

static func get_random_action() -> BaseAction:
	var options: Array = [EnemyIdle, EnemyAttack]
	var index: int = randi_range(0, options.size() - 1)
	var action: BaseAction = options[index].new()
	return action
