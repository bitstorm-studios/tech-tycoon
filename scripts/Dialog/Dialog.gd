extends NinePatchRect

@onready var dialog = $RichTextLabel
@onready var timer = $Timer
@onready var buttons = $Buttons
@export var no_btn = false
@onready var PC_scene = preload("res://scenes/PC/PC.tscn")
var angry_larry = load("res://assets/Clients/Larry_Bravo.png")

func _input(event):
	if event is InputEventMouseButton:
		dialog.visible_characters = dialog.text.length()
		
func show_message(recived_message):
	buttons.hide()
	dialog.visible_characters = 0
	dialog.text = recived_message
	timer.start()

func _on_timer_timeout():
	if dialog.visible_characters == dialog.text.length():
		buttons.show()
		timer.stop()
		pass
	if no_btn:
		buttons.hide()
		pass
	dialog.visible_characters += 1

func _on_aceitar_pressed():
	get_node("/root/Game/MainClient").hide()
	get_node("/root/Game/HUD/Will Hide").hide()
	get_node("Buttons").hide()
	var PC_scene_instantiate = PC_scene.instantiate()
	get_tree().get_root().get_node("/root/Game/MainPC").add_child(PC_scene_instantiate)
	buttons.hide()

func _on_recusar_pressed():
	get_parent().queue_free()
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client/Sprite").texture = angry_larry	
	get_node("/root/Game").is_walking = true
