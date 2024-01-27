extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D

func play_dialogue(AudioPath):
	_audio.stream = AudioPath
	_audio.play()

func _process(_delta):
	#light logic
	pass
