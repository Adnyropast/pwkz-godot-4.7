extends Node

const PHASES: Array = [
	# World 1
	
	[
		[
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
		],
	],
	
	# World 2
	
	[
		[
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
		],
		[
			1,
		],
	],
	
	# World 3
	
	[
		[
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
		],
	],
	
	# World 4
	
	[
		[
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
		],
		[
			1,
		],
	],
	
	# World 5
	
	[
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
		],
	],
	
	# World 6
	
	[
		[
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
		],
		[
			1,
		],
	],
	
	# World 7
	
	[
		[
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
		],
	],
	
	# World 8
	
	[
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
			1,
			1,
			1,
		],
		[
			1,
		],
	],
]

var current_phase: int = 0

func next_phase() -> void:
	current_phase += 1
	
	if current_phase > len(PHASES[Worlds.current_world - 1][Worlds.current_stage - 1]):
		current_phase = 1
		Worlds.next_stage()
	else:
		var tree: SceneTree = Engine.get_main_loop()
		tree.change_scene_to_file("res://scenes/stage_inbetween_screen.tscn")
