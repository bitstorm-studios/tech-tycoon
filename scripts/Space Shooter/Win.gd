extends Control

func _on_continue_pressed():
	get_tree().paused = false
	get_parent().get_parent().get_parent().queue_free()
	get_node("/root/Game/HUD").show()
