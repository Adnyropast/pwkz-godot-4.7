extends Node

@onready var enemy_sprite = $EnemyShake/EnemyBreathe/BossScale/EnemySprite
@onready var palette_sprite = $EnemyShake/EnemyBreathe/BossScale/EnemySprite/PaletteSprite
@onready var boss_scale: Node3D = $EnemyShake/EnemyBreathe/BossScale
@onready var enemy_animation_player: AnimationPlayer = $EnemyShake/EnemyAnimationPlayer

func _ready() -> void:
	enemy_sprite.texture = Enemy.get_texture()
	palette_sprite.texture = Enemy.get_palette_texture()
	palette_sprite.modulate = WorldColors.get_enemy_color(WorldState.current_world)
	setup_boss_sprite()
	Enemy.enemy_hurt.connect(on_enemy_hurt)
	Enemy.enemy_defeated.connect(on_enemy_defeated)

func on_enemy_hurt() -> void:
	enemy_animation_player.play("enemy_hurt")

func on_enemy_defeated() -> void:
	enemy_animation_player.play("enemy_defeat")

func setup_boss_sprite() -> void:
	if Enemy.is_boss():
		var scale: float = 1.5
		boss_scale.scale = Vector3.ONE * scale
		var sprite_dimensions: int = 768
		var pixel_to_3d_space: float = 0.01
		var sprite_dim_3d: float = sprite_dimensions * pixel_to_3d_space
		var ground_level: float = 0.875
		var half_ground_level: float = ground_level - 0.5
		var offset_ground_level_px: float = half_ground_level * sprite_dim_3d
		var offset_diff_px: float = offset_ground_level_px * (1 - scale)
		boss_scale.position.y = -offset_diff_px
