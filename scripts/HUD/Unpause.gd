extends Button

func _on_pressed():
	var pause_scene = get_node("/root/Game/Pause")
	pause_scene.queue_free()
	get_tree().paused = false


func _on_texture_button_2_pressed():
	get_tree().quit()
