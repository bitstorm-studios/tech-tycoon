extends Control

var space_scene = preload("res://scenes/Space Shooter/game.tscn")

func add_points(points: int):
	$Panel/ScoreLabel.text = "Score: " + str(points)

func _on_button_pressed():
	var space_instance = space_scene.instantiate()
	var node = get_node("/root/Game/SpaceShooter")
	node.queue_free()
	get_tree().get_root().get_node("/root/Game").add_child(space_instance)
