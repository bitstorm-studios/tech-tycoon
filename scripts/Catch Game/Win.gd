extends Button

func _on_pressed():
	var node = get_node("/root/CatchGame")
	node.queue_free()
