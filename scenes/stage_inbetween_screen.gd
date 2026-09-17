extends Control

func _ready() -> void:
	var tween: Tween = create_tween()
	tween.tween_callback(load_phase).set_delay(1.0)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		load_phase()

func load_phase() -> void:
	Scenes.go_to_stage_scene()
