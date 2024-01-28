extends Area3D

@export var ball:Node3D
@export var spawnPoint:Node3D

var count = 0

func _on_body_entered(body):
	count += 1


func _on_body_exited(body):
	count -= 1

func _process(_delta):
	if count == 0:
		ball.global_position = spawnPoint.global_position
