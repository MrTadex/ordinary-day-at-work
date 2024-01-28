extends Sprite3D

@export var player:Node

# get player
func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]

func _process(_delta):
	# get transform
	# rotate on y (mebe) towards 
	if player != null:
		look_at(player.position)
		rotation_degrees.z = 0
		rotation_degrees.x = 0
		rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
		
