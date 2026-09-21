extends Node

class_name InterfaceItems

static func create_world_select_item(world: int) -> Node:
	var item: Node = preload("res://scenes/world_select_item.tscn").instantiate()
	item.set_world(world)
	return item
