extends StaticBody3D

@export var _light:SpotLight3D

@onready var _animator = $AnimatedSprite3D
@onready var _audio = $AudioStreamPlayer3D

func clicked():
	if Logger.CanStopAlarm:
		if _animator.animation == "On":
			_animator.play("Off")
			_light.visible = false
			get_tree().call_group("EventListeners", "_on_event", "Stop Alarm")
		elif _animator.animation == "Off":
			_animator.play("On")
			_light.visible = true
			get_tree().call_group("EventListeners", "_on_event", "Start Alarm")

func _on_event(eventName):
	if eventName == "Start Alarm" or eventName == "Start":
		_light.visible = true
	
	if eventName == "Stop Alarm":
		_light.visible = false
