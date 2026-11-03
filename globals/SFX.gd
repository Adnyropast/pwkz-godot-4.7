extends AudioStreamPlayer

var disable_select_sound_once: bool = true
var volume: float = 0.8

func _enter_tree() -> void:
	get_tree().node_added.connect(on_node_added)

func _ready() -> void:
	refresh_volume()

func reset_sound_select() -> void:
	disable_select_sound_once = true

func on_node_added(node: Node) -> void:
	if node is Control:
		node.focus_entered.connect(on_node_focus_entered)
	if node is Button:
		node.action_mode = BaseButton.ACTION_MODE_BUTTON_PRESS
		node.pressed.connect(on_node_pressed)
	if node is Slider:
		node.value_changed.connect(on_node_value_changed)

func on_node_focus_entered() -> void:
	if disable_select_sound_once:
		disable_select_sound_once = false
	else:
		play_select()

func on_node_pressed() -> void:
	play_confirm()

func on_node_value_changed(_value: float) -> void:
	if disable_select_sound_once:
		disable_select_sound_once = false
	else:
		play_select()

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

func refresh_volume() -> void:
	volume_linear = volume * MasterVolume.volume

func set_volume(new_volume: float) -> void:
	volume = new_volume
	refresh_volume()
