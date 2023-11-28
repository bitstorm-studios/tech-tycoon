extends Node2D

func _physics_process(delta: float):
	const move_speed = 350
	$Path2D/PathFollow2D.progress += move_speed * delta
