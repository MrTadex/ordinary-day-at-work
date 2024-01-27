extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D
@onready var _audioPlayer = $AudioStreamPlayer3D/AudioStreamPlayer_P
@onready var audio_repeat:int = 1

func clicked():
	audio_repeat = 1
	_audio.playing = true

func _on_audio_stream_player_3d_finished():
	if audio_repeat == 1:
		_audioPlayer.playing = true
		audio_repeat = 0
