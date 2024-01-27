extends StaticBody3D

var array = [
				preload("res://resources/sound_music/radio_1.ogg"),
				preload("res://resources/sound_music/radio_2.ogg"),
				preload("res://resources/sound_music/radio_3.ogg")
			]

@onready var _audio = $AudioStreamPlayer3D

func clicked():
	if _audio.playing:
		_audio.playing = false
	else:
		_audio.stream = array[randi_range(0,2)]
		_audio.volume_db = -5
		_audio.playing = true

func _on_audio_stream_player_3d_finished():
	_audio.stream = array[randi_range(0,2)]
	_audio.playing = true
