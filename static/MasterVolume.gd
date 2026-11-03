extends Node

class_name MasterVolume

static var volume: float = 0.8

static func refresh_volume() -> void:
	Bgm.refresh_volume()
	Sfx.refresh_volume()

static func set_volume(new_volume: float) -> void:
	volume = new_volume
	refresh_volume()
