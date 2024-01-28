extends StaticBody3D

@onready var _audio = $AudioStreamPlayer3D
@onready var _animator = $AnimatedSprite3D

func _on_event(eventName):
	match eventName:
		_: 
			print("defoult")
