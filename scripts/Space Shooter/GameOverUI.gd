extends Control

func add_points(points: int):
	$Panel/ScoreLabel.text = "Score: " + str(points)

func _on_button_pressed():
	var node = get_node("/root/SpaceShooter")
	node.queue_free()
