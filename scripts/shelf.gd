extends Area3D

func _on_body_entered(_body):
	Logger.items_on_shelfs += 1
	
func _on_body_exited(body):
	Logger.items_on_shelfs -= 1
