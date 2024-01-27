extends StaticBody3D

@export var open:bool = true
@export var open_deg:float
@export var closed_deg:float

@export var speed = 5

func _process(delta):
	if open:
		if rotation_degrees.y > open_deg:
			rotation_degrees.y += speed * delta
			#print(rotation_degrees.y)
	else:
		if rotation_degrees.y < closed_deg:
			rotation_degrees.y -= speed * delta
			#print(rotation_degrees.y)
		
