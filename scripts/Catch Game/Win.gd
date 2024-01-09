extends Button

func _on_pressed():
	get_tree().paused = false
	get_node("/root/Game/CatchGame").queue_free()
	get_node("/root/Game/HUD").show()
