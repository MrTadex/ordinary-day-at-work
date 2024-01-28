extends Node

@onready var timer:Timer = get_node("../Timer")

var current_event = null

func _on_event(eventName):
	pass

func _process(_delta):
	var timeLeft = timer.time_left
	if timeLeft > 0:
		pass

func _on_timer_timeout():
	get_tree().call_group("EventListeners", "_on_event", "End")
