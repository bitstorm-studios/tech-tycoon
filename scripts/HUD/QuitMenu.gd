extends Button

func _on_pressed():
	get_tree().paused = false
	get_node("/root/Menu").show()
	get_node("/root/Game").queue_free()
