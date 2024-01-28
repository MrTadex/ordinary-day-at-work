extends StaticBody3D

@export var timer:Timer

var start = true

@onready var _audio = $AudioStreamPlayer3D

func clicked():
	if start:
		timer.start(240) # 4min
		start = false
		get_tree().call_group("EventListeners", "_on_event", "Start")

	_audio.playing = true

func _process(_delta):
	#print(timer.time_left)
	pass
