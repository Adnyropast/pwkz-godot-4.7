extends AudioStreamPlayer

func stop_bgm() -> void:
	stream = null

func play_stream(audio_stream: AudioStream) -> void:
	if stream != audio_stream:
		stream = audio_stream
		play()

func play_stage() -> void:
	var audio_streams: Array[AudioStream] = [
		preload("res://audio/bgm/st1.ogg"),
		preload("res://audio/bgm/st2.ogg"),
		preload("res://audio/bgm/st3.ogg"),
	]
	var audio_stream: AudioStream = audio_streams[StageThemes.get_theme() - 1]
	play_stream(audio_stream)

func play_theme_title() -> void:
	var audio_stream: AudioStream = preload("res://audio/bgm/th1.ogg")
	play_stream(audio_stream)

func play_theme_victory() -> void:
	var audio_stream: AudioStream = preload("res://audio/bgm/th2.ogg")
	play_stream(audio_stream)

func play_theme_victory_rescue() -> void:
	var audio_stream: AudioStream = preload("res://audio/bgm/th3.ogg")
	play_stream(audio_stream)
