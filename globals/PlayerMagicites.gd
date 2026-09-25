extends Node

enum EquipTypes {
	ATTACK,
	DEFEND,
	HEAL,
}

const MAX_EQUIP_COUNT: int = 6

var attack_magicites: Array[Magicite]
var defend_magicites: Array[Magicite]
var heal_magicites: Array[Magicite]

func equip_magicite_end(type: EquipTypes, magicite: Magicite) -> void:
	if type == EquipTypes.ATTACK:
		if attack_magicites.size() < MAX_EQUIP_COUNT:
			attack_magicites.append(magicite)
			Inventory.remove_magicite(magicite)
	elif type == EquipTypes.DEFEND:
		if defend_magicites.size() < MAX_EQUIP_COUNT:
			defend_magicites.append(magicite)
			Inventory.remove_magicite(magicite)
	elif type == EquipTypes.HEAL:
		if heal_magicites.size() < MAX_EQUIP_COUNT:
			heal_magicites.append(magicite)
			Inventory.remove_magicite(magicite)

func unequip_magicite_at(type: EquipTypes, index: int) -> void:
	if type == EquipTypes.ATTACK:
		var magicite: Magicite = attack_magicites.pop_at(index)
		Inventory.add_magicite(magicite)
	elif type == EquipTypes.DEFEND:
		var magicite: Magicite = defend_magicites.pop_at(index)
		Inventory.add_magicite(magicite)
	elif type == EquipTypes.HEAL:
		var magicite: Magicite = heal_magicites.pop_at(index)
		Inventory.add_magicite(magicite)
