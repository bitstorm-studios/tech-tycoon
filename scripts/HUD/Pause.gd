extends Button

var pause_scene = preload("res://scenes/HUD/Pause.tscn")

func _on_pressed():
	get_tree().paused = true
	var pause_instantieated = pause_scene.instantiate()
	get_tree().get_root().add_child(pause_instantieated)
