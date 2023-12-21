extends NinePatchRect

@onready var dialog = $RichTextLabel
@onready var timer = $Timer
@onready var buttons = $Buttons
@onready var payment = $Payment
@onready var money_label = $Payment/HBoxContainer/Money/MoneyValue
@onready var fame_label = $Payment/HBoxContainer/Fame/FameValue
@onready var PC_scene = preload("res://scenes/PC/PC.tscn")
@export var no_btn = false
@export var money_payment: int
@export var fame_payment: int
var angry_larry = load("res://assets/Clients/Larry_Bravo.png")

func _input(event):
	if event is InputEventMouseButton:
		dialog.visible_characters = dialog.text.length()
		
func show_message(recived_message):
	
	buttons.hide()
	payment.hide()	
	dialog.visible_characters = 0
	dialog.text = recived_message
	timer.start()

func _on_timer_timeout():
	if dialog.visible_characters == dialog.text.length():
		money_payment = randi_range(70, 100)
		fame_payment = randi_range(1, 5)
		money_label.text = str(money_payment)
		fame_label.text = str(fame_payment)
		buttons.show()
		payment.show()
		timer.stop()
		pass
	if no_btn:
		payment.hide()
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
	payment.hide()

func _on_recusar_pressed():
	get_parent().queue_free()
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client/Sprite").texture = angry_larry	
	get_node("/root/Game").is_walking = true
