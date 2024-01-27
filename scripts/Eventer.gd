extends Node

@onready var timer:Timer = get_node("Timer")

# Event
@onready var door_front:Object = get_node("Items/door")
@onready var door_back:Object = get_node("Items/door2")



func _process(delta):
	#if timer.time_left > 0:
		## 
		pass
