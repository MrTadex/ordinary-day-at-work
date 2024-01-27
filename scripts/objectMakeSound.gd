extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D

func clicked():
	#if _audio.playing:
		#_audio.playing = false
	#else:
	_audio.playing = true
