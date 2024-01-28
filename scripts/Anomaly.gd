extends Area3D

@onready var _collider = $CollisionShape3D
@onready var _timer = $Timer

func _on_event(eventName):
	match eventName:
		"Start":
			_collider.disabled = false
			_timer.start(1)
		"End":
			gravity_point_unit_distance = 20
			gravity = -50
			_collider.disabled = false
			_timer.start(1)

func _on_timer_timeout():
	_collider.disabled = true
