extends Node2D
signal collect 

var points = 1

func _process(_delta):
	position.y += randf_range(5, 10)

func _on_body_entered(_body):
	emit_signal("collect")
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
