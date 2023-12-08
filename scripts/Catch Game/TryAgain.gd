extends Button

var catch_scene = preload("res://scenes/Catch Game/Background.tscn")

func _on_pressed():
	get_tree().paused = false
	var catch_instance = catch_scene.instantiate()
	var catch_node = get_node("/root/Game/CatchGame")
	catch_node.queue_free()
	get_tree().get_root().get_node("/root/Game").add_child(catch_instance)
