extends Button

func _on_pressed():
	var pause_scene = get_node("/root/Pause")
	pause_scene.queue_free()
	get_tree().paused = false
