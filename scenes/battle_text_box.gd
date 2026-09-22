extends Control

@onready var label_node: Label = $MarginContainer/PanelContainer/MarginContainer/Label
signal closed
var confirm_tween: Tween
var sender: Sender = Sender.new()

func _ready() -> void:
	sender.message_sent.connect(on_message_sent)
	sender.timed_message_sent.connect(on_timed_message_sent)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		confirm()

func confirm() -> void:
	if confirm_tween:
		confirm_tween.kill()
	
	pause()
	hide()
	
	closed.emit()

func pause() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func unpause() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT

func tween_confirm(timeout: float) -> void:
	confirm_tween = create_tween()
	confirm_tween.tween_callback(confirm).set_delay(timeout)

func on_message_sent(message: String, callback_callable: Callable) -> void:
	label_node.text = message
	unpause()
	show()
	closed.connect(callback_callable, CONNECT_ONE_SHOT)

func on_timed_message_sent(message: String, callback_callable: Callable, timeout: float) -> void:
	on_message_sent(message, callback_callable)
	tween_confirm(timeout)
