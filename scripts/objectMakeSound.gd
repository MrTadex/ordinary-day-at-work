extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D
@onready var _audioPlayer = $AudioStreamPlayer3D/AudioStreamPlayer_P

func clicked():
	_audio.playing = true

func _on_audio_stream_player_3d_finished():
	_audioPlayer.playing = true
