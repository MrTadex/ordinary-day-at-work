extends RigidBody3D

@onready var _audio = $AudioStreamPlayer3D

func _on_body_entered(body):
	_audio.play()
