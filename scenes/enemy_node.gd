extends Node

@onready var enemy_sprite = $EnemyShake/EnemyBreathe/EnemySprite
@onready var palette_sprite = $EnemyShake/EnemyBreathe/EnemySprite/PaletteSprite
@onready var enemy_animation_player: AnimationPlayer = $EnemyShake/EnemyAnimationPlayer

func _ready() -> void:
	enemy_sprite.texture = Enemy.get_texture()
	palette_sprite.texture = Enemy.get_palette_texture()
	palette_sprite.modulate = WorldColors.get_enemy_color(WorldState.current_world)
	Enemy.enemy_hurt.connect(on_enemy_hurt)
	Enemy.enemy_defeated.connect(on_enemy_defeated)

func on_enemy_hurt() -> void:
	enemy_animation_player.play("enemy_hurt")

func on_enemy_defeated() -> void:
	enemy_animation_player.play("enemy_defeat")
