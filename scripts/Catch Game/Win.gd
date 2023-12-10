extends Button

func _on_pressed():
	get_tree().paused = false
	self.get_parent().get_parent().get_parent().queue_free()
	get_node("/root/Game/MainPC").show()
