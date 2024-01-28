extends Node3D

var _nina = preload("res://prefabs/nina_the_manager.tscn")

func _on_event(eventName):
	if eventName == "Spawn Nina":
		var nina = _nina.instantiate()
		nina.position = position
