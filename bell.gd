extends Node

@onready var _audio = $AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clicked():
	if _audio.playing:
		_audio.playing = false
	else:
		_audio.playing = true
