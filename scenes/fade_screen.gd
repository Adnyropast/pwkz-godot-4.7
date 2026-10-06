extends Control

signal faded_out
@onready var fade_out_animation_player: AnimationPlayer = $FadeOutAnimationPlayer
@onready var fade_in_animation_player: AnimationPlayer = $FadeInAnimationPlayer
@onready var panel: Panel = $Panel

func _ready() -> void:
	panel.get_theme_stylebox("panel").set("bg_color", WorldColors.get_screen_color(WorldState.current_world))

func on_faded_out() -> void:
	faded_out.emit()
	fade_in_animation_player.play("fade_screen_fade_in")
