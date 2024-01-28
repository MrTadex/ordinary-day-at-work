extends Node3D

var _nina := preload("res://prefabs/nina_the_manager.tscn")
@export var end:Node


func _on_event(eventName):
	if eventName == "End":
		var manager = _nina.instantiate()
		manager.position = position
		end.add_child(manager)
		print(manager.position)
		#manager
