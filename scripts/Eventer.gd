extends Node

@onready var timer:Timer = get_node("../Timer")

var current_event = null

signal Event(eventName)

func call_event(eventName):
	if current_event == null:
		Event.emit(eventName)
	
func end_event(eventName):
	Event.emit(eventName)

func _process(delta):
	var timeLeft = timer.time_left
	if timeLeft > 0:
		if timeLeft == 900:
			call_event("Start")
