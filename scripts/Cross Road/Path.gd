extends Path2D

var car_array = [preload("res://scenes/Cross Road/CarP.tscn"), 
preload("res://scenes/Cross Road/CarM.tscn"), 
preload("res://scenes/Cross Road/CarG.tscn"),
preload("res://scenes/Cross Road/CarGG.tscn")]

var timer = 0
var spawnTime = randf_range(0.8, 1.3)

func _process(delta):
	timer = timer + delta
	
	if(timer > spawnTime):
		var random_car:PackedScene = car_array.pick_random()
		var car_instatiate = random_car.instantiate()
		self.add_child(car_instatiate)
		spawnTime = randf_range(0.8, 1.3)
		timer = 0
