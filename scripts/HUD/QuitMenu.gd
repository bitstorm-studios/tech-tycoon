extends Button

func _on_pressed():
	get_node("/root/Menu").show()
	get_node("/root/Game").queue_free()
	get_tree().paused = false
