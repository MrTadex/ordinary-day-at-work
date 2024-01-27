extends StaticBody3D

@export var open:bool = true
@export var open_deg:float
@export var closed_deg:float


func _process(delta):
	if open:
		rotation_degrees.y = open_deg
	else:
		rotation_degrees.y = closed_deg
