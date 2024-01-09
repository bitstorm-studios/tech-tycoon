extends Control

var catch_scene = preload("res://scenes/Catch Game/Background.tscn")

func _on_retry_button_pressed():
	get_tree().paused = false
	get_parent().queue_free()
	var catch_instance = catch_scene.instantiate()
	get_tree().get_root().get_node("/root/Game").add_child(catch_instance)
