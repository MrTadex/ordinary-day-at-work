extends StaticBody3D

@onready var _audio = preload("res://resources/sound_music/fall_bonk_1.ogg")

func clicked():
	_audio.playing = true
