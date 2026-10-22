extends AudioStreamPlayer

var disable_select_sound_once: bool = true

func _enter_tree() -> void:
	get_tree().node_added.connect(on_node_added)

func reset_sound_select() -> void:
	disable_select_sound_once = true

func on_node_added(node: Node) -> void:
	if node is Button:
		node.action_mode = BaseButton.ACTION_MODE_BUTTON_PRESS
		node.focus_entered.connect(on_node_focus_entered)
		node.pressed.connect(on_node_pressed)

func on_node_focus_entered() -> void:
	if disable_select_sound_once:
		disable_select_sound_once = false
	else:
		play_select()

func on_node_pressed() -> void:
	play_confirm()

func play_select() -> void:
	var audio_stream: AudioStream = preload("res://audio/sfx/sf1.ogg")
	stream = audio_stream
	play()

func play_confirm() -> void:
	var audio_stream: AudioStream = preload("res://audio/sfx/sf2.ogg")
	stream = audio_stream
	play()

func play_hit() -> void:
	var audio_stream: AudioStream = preload("res://audio/sfx/sf3.ogg")
	stream = audio_stream
	play()

func play_heal() -> void:
	var audio_stream: AudioStream = preload("res://audio/sfx/sf4.ogg")
	stream = audio_stream
	play()

func play_ko() -> void:
	var audio_stream: AudioStream = preload("res://audio/sfx/sf5.ogg")
	stream = audio_stream
	play()
