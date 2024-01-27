extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D

func clicked():
	_audio.playing = true
