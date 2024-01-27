extends Node3D

@export var playing:bool = false

@onready var _audio = $AudioStreamPlayer3D

func clicked():
	if _audio.playing:
		_audio.playing = false
	else:
		_audio.playing = true
