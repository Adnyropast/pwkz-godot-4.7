extends Control

@onready var label_node: Label = $MarginContainer/PanelContainer/MarginContainer/Label
signal closed
var is_victory: bool = false
var confirm_tween: Tween

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		confirm()

func set_victory() -> void:
	is_victory = true
	label_node.text = "You won!"
	unpause()
	show()

func confirm() -> void:
	confirm_tween.kill()
	pause()
	
	if not is_victory:
		hide()
	
	closed.emit(is_victory)

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func unpause() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT

func set_player_idle() -> void:
	label_node.text = "Maria is standing by."
	unpause()
	show()
	tween_confirm()

func set_enemy_idle(enemy_id: int) -> void:
	label_node.text = Enemies.get_enemy_name(enemy_id) + " is standing by."
	unpause()
	show()
	tween_confirm()

func tween_confirm() -> void:
	confirm_tween = create_tween()
	confirm_tween.tween_callback(confirm).set_delay(2.0)
