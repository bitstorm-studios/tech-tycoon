extends Area2D

signal give_points(points: int)

var points: int = 1
@onready var laser_container = $LaserContainer

var laser_scene :PackedScene = preload("res://scenes/Space Shooter/enemy_laser.tscn")
var can_shoot

func _ready():
	await get_tree().create_timer(1).timeout
	try_shoot()

func _physics_process(_delta):
	#global_position.x  =global_position.x - (speed * delta)
	global_position.x = global_position.x + ((randi()%300) * _delta)
	global_position.x = global_position.x - ((randi()%300) * _delta)
	global_position.y = global_position.y + ((randi()%200) * _delta)
	global_position.y = global_position.y - ((randi()%200) * _delta)
	var screen_size = get_viewport_rect().size # posiçao maxima onde o player pode ir
	var min_vector_position = Vector2(0, 80) # posiçao minima onde pode ir (89 pixels de hud)
	global_position = global_position.clamp(min_vector_position, screen_size) # clamp limita a area de movimentaçao


func try_shoot():
	can_shoot = randi_range(1, 5)
	if can_shoot == 1:
		can_shoot = -1
		var laser_instance = laser_scene.instantiate()
		laser_instance.global_position = Vector2(global_position.x, global_position.y + 20)
		laser_container.add_child(laser_instance)
		get_node("AnimatedSprite2D").play()
		await get_tree().create_timer(1.5).timeout
	else:
		await get_tree().create_timer(0.3).timeout
		try_shoot()
	
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func die():
	emit_signal("give_points", points)
	queue_free()

func _on_area_entered(_area):
	die()

func _on_body_entered(body):
	body.take_damage()
	die()


func _on_animated_sprite_2d_animation_finished():
	try_shoot()
