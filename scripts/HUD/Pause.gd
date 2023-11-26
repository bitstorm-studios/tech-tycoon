extends Button

var pause_scene: PackedScene = preload("res://scenes/HUD/Pause.tscn")

func _on_pressed():
	var pause_scene_instance = pause_scene.instantiate()
	get_tree().paused = true
	get_tree().get_root().add_child(pause_scene_instance)
