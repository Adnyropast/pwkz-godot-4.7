extends Node3D

signal intro_animation_finished
@onready var intro_animation_player: AnimationPlayer = $IntroAnimationPlayer
@onready var enemy_action_start_animation_player: AnimationPlayer = $EnemyActionStartAnimationPlayer
@onready var enemy_action_end_animation_player: AnimationPlayer = $EnemyActionEndAnimationPlayer
@onready var battle_commands_menu_fade_in_animation_player: AnimationPlayer = $BattleCommandsMenuFadeInAnimationPlayer
@onready var battle_commands_menu_fade_out_animation_player: AnimationPlayer = $BattleCommandsMenuFadeOutAnimationPlayer
@onready var camera: Camera3D = $OffsetNode/CameraDistance/ZoomNode/Camera3D
var is_intro_animation_finished

func _ready() -> void:
	camera.environment.background_color = WorldColors.get_background_color(WorldState.current_world)

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

func on_enemy_action_start() -> void:
	enemy_action_start_animation_player.play("camera_enemy_action_start")

func on_enemy_action_end() -> void:
	enemy_action_end_animation_player.play("camera_enemy_action_end")

func on_commands_menu_fade_in() -> void:
	if is_intro_animation_finished:
		battle_commands_menu_fade_in_animation_player.play("battle_camera_commands_menu_fade_in")

func on_commands_menu_fade_out() -> void:
	if is_intro_animation_finished:
		battle_commands_menu_fade_out_animation_player.play("battle_camera_commands_menu_fade_out")
