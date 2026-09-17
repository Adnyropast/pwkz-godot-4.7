extends Node

const PRINCES_NAMES: Array = [
	"Princess Clara",
	"Prince Grant",
	"Princess Lima",
	"Prince Skyler",
	"Princess Berie",
	"Prince Pastor",
	"Princess Jennie",
	"Prince Maeve",
]

func get_prince_name(world: int) -> String:
	return PRINCES_NAMES[world - 1]
