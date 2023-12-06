extends Button

var catch_scene = preload("res://scenes/Catch Game/Background.tscn")

func _on_pressed():
	get_tree().paused = false
	var catch_instance = catch_scene.instantiate()
	self.get_parent().get_parent().get_parent().queue_free()
	get_tree().get_root().get_node("/root/Game").add_child(catch_instance)
