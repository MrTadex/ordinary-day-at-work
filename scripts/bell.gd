extends StaticBody3D

@export var timer:Timer

var start = true

@onready var _audio = $AudioStreamPlayer3D

func clicked():
	if start:
		timer.start(900)
		start = false

	_audio.playing = true

func _process(delta):
	#print(timer.time_left)
	pass
