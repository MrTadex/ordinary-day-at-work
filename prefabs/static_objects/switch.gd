extends StaticBody3D

@export var Eventer:Node

@onready var _animator = $AnimatedSprite3D

func clicked():
	if _animator.animation == "On":
		_animator.play("Off")
		Eventer.call_event("Stop Alarm")
	elif _animator.animation == "Off":
		_animator.play("On")
		Eventer.call_event("Start Alarm")


func _on_eventer_event(eventName):
	if eventName == "Start" and _animator.animation == "Off":
		Eventer.call_event("Stop Alarm")
