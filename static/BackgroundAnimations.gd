extends Node

class_name BackgroundAnimations

static func pick_random_animation() -> Node3D:
	var animations: Array[Resource] = [
		preload("res://scenes/background_animations/circles_background_animation.tscn"),
		preload("res://scenes/background_animations/wave_up_background_animation.tscn"),
		preload("res://scenes/background_animations/embers_background_animation.tscn"),
		preload("res://scenes/background_animations/dash_dotted_background_animation.tscn"),
		preload("res://scenes/background_animations/rain_background_animation.tscn"),
	]
	var index: int = randi_range(0, animations.size() - 1)
	var animation: Node3D = animations[index].instantiate()
	return animation
