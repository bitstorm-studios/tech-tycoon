extends NinePatchRect

@onready var dialog = $RichTextLabel
@onready var timer = $Timer
@onready var buttons = $Buttons
@onready var PC_scene = preload("res://scenes/PC/PC.tscn")
var message = "Olá, meu computador está muito lento, quero que você formate ele e instale uma nova memória RAM."

func _input(event):
	if event is InputEventMouseButton:
		dialog.visible_characters = dialog.text.length()
		
func show_message():
	buttons.hide()
	dialog.visible_characters = 0
	dialog.text = message
	timer.start()

func _on_timer_timeout():
	if dialog.visible_characters == dialog.text.length():
		buttons.show()
		pass
	dialog.visible_characters += 1

func _on_aceitar_pressed():
	get_node("/root/Game/MainClient").hide()
	get_node("/root/Game/HUD/Will Hide").hide()
	var PC_scene_instantiate = PC_scene.instantiate()
	get_tree().get_root().get_node("/root/Game/MainPC").add_child(PC_scene_instantiate)


func _on_recusar_pressed():
	get_parent().queue_free()
	get_node("/root/Game").set_physics_process(true)
