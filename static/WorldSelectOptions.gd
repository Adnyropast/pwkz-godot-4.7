extends Node

class_name WorldSelectOptions

static func get_next_worlds_options() -> Array[int]:
	return get_next_worlds_options_for_world(WorldState.current_world)

static func get_next_worlds_options_for_world(world: int) -> Array[int]:
	var world_a: int = get_next_world_for_world(world)
	
	var other_options: Array[int] = get_all_other_options_for_world(world)
	
	var world_b: int = worlds_random_pop(other_options)
	var world_c: int = worlds_random_pop(other_options)
	
	var options: Array[int] = [world_a, world_b, world_c]
	options.sort()
	
	return options

static func get_next_world_for_world(world: int) -> int:
	var next_world: int = world + 1
	if next_world > WorldConstants.WORLDS_COUNT:
		next_world = 1
	return next_world

static func get_all_other_options_for_world(world: int) -> Array[int]:
	var next_world: int = get_next_world_for_world(world)
	var options: Array[int] = []
	
	for i in range(1, mini(WorldConstants.WORLDS_COUNT + 1, world + 5)):
		if i != world and i != next_world:
			options.append(i)
	
	return options

static func worlds_random_pop(worlds: Array[int]) -> int:
	var index: int = randi_range(0, worlds.size() - 1)
	var world: int = worlds.pop_at(index)
	return world
