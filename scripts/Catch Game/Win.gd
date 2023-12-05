extends Button

func _on_pressed():
	get_tree().paused = false
	var node = get_node("/root/Game/CatchGame")
	node.queue_free()
