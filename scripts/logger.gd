extends Node

@export var items_on_shelfs:int = 0

@export var Start:bool = false
@export var CanStopAlarm:bool = false
@export var CanFish:bool = false
@export var SeenFish:bool = false

func _ready():
	add_to_group("EventListeners")

func _on_event(eventName):
	match eventName:
		"Start":
			Start = true
		"Can Stop Alarm":
			CanStopAlarm = true
		"Can Fish":
			CanFish = true

func _process(_delta):
	#print(items_on_shelfs)
	pass
