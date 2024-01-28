extends StaticBody3D

@export var player:Node
@onready var _audio = $AudioStreamPlayer3D

func clicked():
	_audio.playing = true

# get player
func _ready():
	#player = get_node("../player")
	pass

func _process(delta):
	# get transform
	# rotate on y (mebe) towards 
	if player != null:
		look_at(player.position)
		rotation_degrees.z = 0
		rotation_degrees.x = 0
		rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
		
