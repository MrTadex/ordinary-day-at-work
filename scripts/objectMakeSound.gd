extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D
#@onready var _audio_player = $AudioStreamPlayer3D
@onready var audio_repeat:int = 1

var array = [
				preload("res://resources/sound_music/player_sound/script_29_vroom.ogg")
			]

func clicked():
	audio_repeat = 1
	_audio.playing = true

func _on_audio_stream_player_3d_finished():
	if audio_repeat == 1:
		_audio.stream = array[0]
		_audio.volume_db = 10
		_audio.playing = true
		audio_repeat = 0
