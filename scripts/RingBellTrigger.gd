extends Area3D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("CALL")
		get_tree().call_group("EventListeners", "_on_event", "Ring Bell Dialogue")
		queue_free()
