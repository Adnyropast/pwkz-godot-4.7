extends Control

@onready var worlds_container: Container = $CenterContainer/WorldsContainer
var next_world: int

func on_select_button_pressed(world: int) -> void:
	next_world = world
	pause()
	PopupInterfaces.open_equip_screen_popup(on_equip_screen_closed)

func on_equip_screen_closed() -> void:
	Worlds.move_to_world(next_world)

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func unpause() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT

func set_worlds(worlds: Array[int]) -> void:
	for world in worlds:
		var item: Node = InterfaceItems.create_world_select_item(world)
		var select_button_pressed: Signal = item.select_button_pressed
		select_button_pressed.connect(on_select_button_pressed)
		worlds_container.add_child(item)
