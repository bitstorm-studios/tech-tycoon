extends Node2D

@onready var tile_map = $"../Map"
@onready var player = $Player_Sprite

var is_moving = false

func _physics_process(_delta):
	if is_moving == false:
		return 
		
	if global_position == player.global_position:
		is_moving = false
		return
	
	player.global_position = player.global_position.move_toward(global_position, 1)
	
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)

func _process(_delta):
 	
	if is_moving:
		return
	
	if Input.is_action_pressed("up"):
		move(Vector2i.UP)
	elif Input.is_action_pressed("down"):
		move(Vector2i.DOWN)
	elif Input.is_action_pressed("left"):
		move(Vector2i.LEFT)
	elif Input.is_action_pressed("right"):
		move(Vector2i.RIGHT)

func move(direction: Vector2i):
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	var target_tile: Vector2i = Vector2i(current_tile.x + direction.x, current_tile.y + direction.y)
	
	var tile_data:TileData = tile_map.get_cell_tile_data(0, target_tile)
	
	if tile_data.get_custom_data("walkable") == false:
		return
		
	is_moving = true 
	
	global_position = tile_map.map_to_local(target_tile)
	player.global_position = tile_map.map_to_local(current_tile)
