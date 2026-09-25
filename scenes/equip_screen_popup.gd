extends Control

signal next_button_pressed

@onready var tab_magicite_texture: TextureRect = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer3/VBoxContainer/HBoxContainer/TabMagiciteTexture
@onready var equipped_container: Container = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer3/VBoxContainer/EquippedContainer
@onready var magicites_container: Container = $MarginContainer/PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/VBoxContainer/MagicitesContainer
var tab: PlayerMagicites.EquipTypes = PlayerMagicites.EquipTypes.ATTACK

func _ready() -> void:
	refresh_tabs()

func _on_button_attack_pressed() -> void:
	set_tab_attack()

func _on_button_defend_pressed() -> void:
	set_tab_defend()

func _on_button_heal_pressed() -> void:
	set_tab_heal()

func _on_button_debug_max_pressed() -> void:
	RewardSystem.debug_max_magicites()
	refresh_tabs()

func _on_button_next_pressed() -> void:
	next_button_pressed.emit()

func on_inventory_magicite_item_pressed(magicite: Magicite) -> void:
	PlayerMagicites.equip_magicite_end(tab, magicite)
	refresh_tabs()

func on_equipped_magicite_item_pressed(index: int) -> void:
	PlayerMagicites.unequip_magicite_at(tab, index)
	refresh_tabs()

func refresh_equipped_magicites(magicites: Array[Magicite]) -> void:
	for child in equipped_container.get_children():
		equipped_container.remove_child(child)
	
	for i in range(0, PlayerMagicites.MAX_EQUIP_COUNT):
		if i < magicites.size():
			var magicite: Magicite = magicites[i]
			var item: Node = preload("res://scenes/equip_equipped_magicite_item.tscn").instantiate()
			equipped_container.add_child(item)
			item.set_magicite(magicite)
			item.set_index(i)
			item.button_pressed.connect(on_equipped_magicite_item_pressed)
		else:
			var item: Node = preload("res://scenes/equip_equipped_magicite_item.tscn").instantiate()
			equipped_container.add_child(item)
			item.set_magicite(null)

func refresh_inventory_magicites(magicites: Dictionary[Magicite, int]) -> void:
	for child in magicites_container.get_children():
		magicites_container.remove_child(child)
	
	for i in range(0, magicites.size()):
		var magicite: Magicite = magicites.keys()[i]
		var quantity: int = magicites.get(magicite)
		var item: Node = preload("res://scenes/equip_inventory_magicite_item.tscn").instantiate()
		magicites_container.add_child(item)
		item.set_magicite(magicite)
		item.set_quantity(quantity)
		item.button_pressed.connect(on_inventory_magicite_item_pressed)

func refresh_tab_magicite_texture(texture: Texture2D) -> void:
	tab_magicite_texture.texture = texture

func refresh_tabs() -> void:
	if tab == PlayerMagicites.EquipTypes.ATTACK:
		refresh_equipped_magicites(PlayerMagicites.attack_magicites)
		refresh_inventory_magicites(Inventory.get_attack_magicites())
		refresh_tab_magicite_texture(preload("res://images/magicites/mt1.png"))
	elif tab == PlayerMagicites.EquipTypes.DEFEND:
		refresh_equipped_magicites(PlayerMagicites.defend_magicites)
		refresh_inventory_magicites(Inventory.get_defend_magicites())
		refresh_tab_magicite_texture(preload("res://images/magicites/mt2.png"))
	elif tab == PlayerMagicites.EquipTypes.HEAL:
		refresh_equipped_magicites(PlayerMagicites.heal_magicites)
		refresh_inventory_magicites(Inventory.get_heal_magicites())
		refresh_tab_magicite_texture(preload("res://images/magicites/mt3.png"))

func set_tab_attack() -> void:
	tab = PlayerMagicites.EquipTypes.ATTACK
	refresh_tabs()

func set_tab_defend() -> void:
	tab = PlayerMagicites.EquipTypes.DEFEND
	refresh_tabs()

func set_tab_heal() -> void:
	tab = PlayerMagicites.EquipTypes.HEAL
	refresh_tabs()
