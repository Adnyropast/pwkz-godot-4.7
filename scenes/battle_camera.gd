extends Node3D

signal intro_animation_finished
@onready var intro_animation_player: AnimationPlayer = $IntroAnimationPlayer
var is_intro_animation_finished

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		skip_start_animation()

func skip_start_animation() -> void:
	if not is_intro_animation_finished:
		intro_animation_player.stop()
		on_start_animation_finished()

func on_start_animation_finished() -> void:
	is_intro_animation_finished = true
	intro_animation_finished.emit()
