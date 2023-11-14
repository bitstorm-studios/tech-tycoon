extends CharacterBody2D

var run_speed = 600

func _physics_process(_delta):
	velocity.x = 0
	var screen = get_viewport_rect().size

	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += run_speed
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= run_speed
		
	global_position.x = clamp(global_position.x, 0, screen.x)
	move_and_slide()
