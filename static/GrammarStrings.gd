extends Node

class_name GrammarStrings

static func n_turns(turns: int) -> String:
	if turns == 1:
		return str(turns) + " turn"
	return str(turns) + " turns"
