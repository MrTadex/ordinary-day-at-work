extends RigidBody3D

@onready var _audio = $AudioStreamPlayer3D

var array = [
				preload("res://resources/sound_music/fall_bonk_1.ogg"),
				preload("res://resources/sound_music/fall_bonk_2.ogg")
			]

func _on_body_entered(_body):
	_audio.stream = array[randi_range(0,1)]
	_audio.volume_db = 35
	_audio.playing = true


func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_entered(body):
	pass # Replace with function body.
