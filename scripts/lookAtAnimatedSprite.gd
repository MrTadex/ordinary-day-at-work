extends AnimatedSprite3D

@export var player:Node

# get player
func _ready():
	pass

func _process(_delta):
	# get transform
	# rotate on y (mebe) towards 
	if player != null:
		look_at(player.position)
		rotation_degrees.z = 0
		rotation_degrees.x = 0
		rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
		


func _on_beans_body_entered(body):
	pass # Replace with function body.
