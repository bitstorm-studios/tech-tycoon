extends Button

func _on_pressed():
	get_tree().paused = false
	get_node("/root/Game/SpaceShooter").queue_free()
	get_node("/root/Game/MainPC").show()
