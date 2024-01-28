extends Node3D

@export var nina : Node3D

func _on_event(eventName):
	if eventName == "End":
		nina.position = position
		#print(nina.position)
		#manager
