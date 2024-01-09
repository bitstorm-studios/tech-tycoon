extends Area2D

@export var speed : int = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y = global_position.y + (speed * delta)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # libera o buffer de lasers instanciados para nao usar memoria desnecessaria

func _on_body_entered(body):
	body.take_damage()
	queue_free()
