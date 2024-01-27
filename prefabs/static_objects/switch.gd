extends StaticBody3D

@export var Eventer:Node

@onready var _animator = $AnimatedSprite3D

func clicked():
	if _animator.animation == "On":
		_animator.play("Off")
		get_tree().call_group("EventListeners", "_on_event", "Stop Alarm")
	elif _animator.animation == "Off":
		_animator.play("On")
		get_tree().call_group("EventListeners", "_on_event", "Start Alarm")

func _on_event(eventName):
	if eventName == "Start" and _animator.animation == "Off":
		get_tree().call_group("EventListeners", "_on_event", "Start Alarm")
