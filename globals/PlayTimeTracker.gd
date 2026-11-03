extends Node

var time_ms: int = 0
var last: int

func _process(_delta: float) -> void:
	var now: int = Time.get_ticks_msec()
	var diff: int = now - last
	time_ms += diff
	last = now

func reset() -> void:
	time_ms = 0
	last = Time.get_ticks_msec()
