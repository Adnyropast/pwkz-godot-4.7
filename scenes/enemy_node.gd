extends Control

@onready var enemy_texture: TextureRect = $EnemyShake/EnemyBreathe/EnemyTexture
@onready var enemy_animation_player: AnimationPlayer = $EnemyShake/EnemyAnimationPlayer

func _ready() -> void:
	enemy_texture.texture = Enemy.get_texture()
	Enemy.enemy_hurt.connect(on_enemy_hurt)
	Enemy.enemy_defeated.connect(on_enemy_defeated)

func on_enemy_hurt() -> void:
	enemy_animation_player.play("enemy_hurt")

func on_enemy_defeated() -> void:
	enemy_animation_player.play("enemy_defeat")
