extends CharacterBody2D

signal took_damage

@export var speed :int = 350
@onready var laser_container = $LaserContainer # a cena so podera carregar apos o lasercontainer carregar 

var laser_scene :PackedScene = preload("res://scenes/laser.tscn")
var can_i_shoot = true # variavel para impedir tiros sequenciais infinitos

func _ready():
	var screen_size = get_viewport_rect().size
	print(screen_size)

func _physics_process(delta):
	velocity = Vector2.ZERO # [0,0] zera os vectors em x e y
	if Input.is_key_pressed(KEY_W):
		velocity.y = -speed
	if Input.is_key_pressed(KEY_S):
		velocity.y = speed
	if Input.is_key_pressed(KEY_A):
		velocity.x = -speed
	if Input.is_key_pressed(KEY_D):
		velocity.x = speed
	move_and_slide() # nao multiplica velocity por delta pq o move_and_slide ja utiliza ela
	
	if Input.is_key_pressed(KEY_SPACE) and can_i_shoot:
		can_i_shoot = false # impede o proximo tiro
		var laser_instance = laser_scene.instantiate() # instancia o tiro
		laser_instance.global_position = Vector2(global_position.x + 20, global_position.y) #define a posiçao inicial do laser como a posiçao do player
		
		laser_container.add_child(laser_instance)
		$LaserSound.play()
		
		await get_tree().create_timer(0.2).timeout # aguarda um pouco ate o proximo tiro ser liberado
		can_i_shoot = true
	
	var screen_size = get_viewport_rect().size # posiçao maxima onde o player pode ir
	var min_vector_position = Vector2(0, 80) # posiçao minima onde pode ir (89 pixels de hud)
	global_position = global_position.clamp(min_vector_position, screen_size) # clamp limita a area de movimentaçao

func take_damage():
	emit_signal("took_damage")

func die():
	queue_free()
