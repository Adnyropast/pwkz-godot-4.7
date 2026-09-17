extends Node

const WORLDS_COUNT: int = 8
const WORLD_STAGES_COUNT: int = 4
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

func get_phases_count(world: int, stage: int) -> int:
	return len(PHASES[world - 1][stage - 1])
