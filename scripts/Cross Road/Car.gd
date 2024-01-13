extends PathFollow2D

func _process(delta):
	var move_speed = 200
	self.progress += move_speed * delta
	
	if self.progress_ratio == 1:
		queue_free()
