extends Node

const WORLDS_COUNT: int = 8
const WORLD_STAGES_COUNT: int = 4
const PHASES: Array = [
	# World 1
	
	[
		[
			1,
			2,
			4,
		],
		[
			2,
			5,
			3,
			2,
		],
		[
			5,
			6,
			3,
			5,
		],
		[
			21,
		],
	],
	
	# World 2
	
	[
		[
			1,
			9,
			4,
		],
		[
			9,
			7,
			3,
			5,
		],
		[
			2,
			1,
			9,
		],
		[
			22,
		],
	],
	
	# World 3
	
	[
		[
			10,
			2,
			10,
		],
		[
			10,
			5,
			7,
			9,
		],
		[
			6,
			10,
			3,
			11,
		],
		[
			23,
		],
	],
	
	# World 4
	
	[
		[
			5,
			4,
			8,
		],
		[
			5,
			6,
			7,
			5,
		],
		[
			10,
			9,
			5,
		],
		[
			24,
		],
	],
	
	# World 5
	
	[
		[
			7,
			12,
			1,
			6,
		],
		[
			8,
			2,
			7,
			9,
		],
		[
			7,
			5,
			8,
			11,
		],
		[
			25,
		],
	],
	
	# World 6
	
	[
		[
			11,
			3,
			10,
		],
		[
			11,
			9,
			11,
		],
		[
			12,
			7,
			11,
		],
		[
			26,
		],
	],
	
	# World 7
	
	[
		[
			8,
			4,
			10,
		],
		[
			7,
			5,
			8,
			9,
		],
		[
			6,
			8,
			12,
			8,
		],
		[
			27,
		],
	],
	
	# World 8
	
	[
		[
			1,
			12,
			2,
			6,
		],
		[
			9,
			5,
			10,
			8,
		],
		[
			12,
			7,
			11,
			12,
		],
		[
			28,
		],
	],
]

func get_phases_count(world: int, stage: int) -> int:
	return len(PHASES[world - 1][stage - 1])
