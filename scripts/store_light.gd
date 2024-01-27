extends Node3D

@onready var _animator = $AnimatedSprite3D
@onready var _light = $SpotLight3D

func _on_event(eventName):
	if eventName == "Start" or eventName == "Start Alarm":
		_animator.play("Off")
		_light.visible = false
		_animator.shaded = true
		
	if eventName == "Stop Alarm":
		_animator.play("On")
		_light.visible = true
		_animator.shaded = false
