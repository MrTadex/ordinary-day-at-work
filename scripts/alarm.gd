extends Node3D

@onready var _audio = $AudioStreamPlayer3D
@onready var _animation = $AnimatedSprite3D
@onready var _light = $SpotLight3D

var alarm = false

func _process(delta):
	if alarm:
		if !_audio.playing:
			_audio.play()
		_animation.play("Alarm")
		_animation.shaded = false
		if _animation.frame == 1:
			_light.visible = true
		else:
			_light.visible = false
		
	else:
		_audio.stop()
		_animation.play("Idle")
		_animation.shaded = true
		_light.visible = false


func _on_event(eventName):
	if eventName == "Start" or eventName == "Start Alarm":
		alarm = true
		
	if eventName == "Stop Alarm":
		alarm = false
