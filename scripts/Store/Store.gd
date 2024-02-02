extends Control

func _on_close_pressed():
	get_tree().paused = false
	self.hide()
