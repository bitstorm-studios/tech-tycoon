extends Control

func _on_close_pressed():
	self.hide()
	get_tree().paused = false
