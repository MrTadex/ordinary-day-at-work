extends Area3D

var count = 0

@export var textLable:Label3D

func _on_body_entered(body):
	print(body.name)
	if body.name == "ball":
		print("Goal")
		count += 1
		textLable.text = str(count)
