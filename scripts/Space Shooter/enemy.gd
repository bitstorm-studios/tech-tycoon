extends Area2D

signal give_points(points: int)

@export var speed:int = 250
@export var points: int = 10
func _process(delta):
	global_position.x  =global_position.x - (speed * delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func die():
	emit_signal("give_points", points)
	queue_free()

func _on_area_entered(area):
	die()

func _on_body_entered(body):
	body.take_damage()
	die()
