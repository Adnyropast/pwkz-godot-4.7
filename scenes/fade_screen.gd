extends Control

signal faded_out
@onready var fade_out_animation_player: AnimationPlayer = $FadeOutAnimationPlayer
@onready var fade_in_animation_player: AnimationPlayer = $FadeInAnimationPlayer

func on_faded_out() -> void:
	faded_out.emit()
	fade_in_animation_player.play("fade_screen_fade_in")
