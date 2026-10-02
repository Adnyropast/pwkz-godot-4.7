extends AudioStreamPlayer

func _enter_tree() -> void:
	get_tree().node_added.connect(on_node_added)

func on_node_added(node: Node) -> void:
	if node is Button:
		node.pressed.connect(Sfx.play_confirm)

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
