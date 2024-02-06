extends TextureRect

@onready var dialog = $RichTextLabel
@onready var timer = $Timer
@onready var buttons = $"../Buttons"
@onready var money_label = $"../Buttons/Aceitar/MoneyValue"
@onready var fame_label = $"../Buttons/Aceitar/FameValue"
@onready var PC_scene = preload("res://scenes/PC/PC.tscn")
@export var no_btn = false
@export var money_payment: int
@export var fame_payment: int

func _input(event):
	if event is InputEventMouseButton:
		dialog.visible_characters = dialog.text.length()

func update_payment_upgrades():
	if get_node("/root/Game").item_biblia:
		money_payment *= 1.1
	if get_node("/root/Game").item_neuralyzer:
		money_payment *= 1.1
		fame_payment *= 1.1
	if get_node("/root/Game").item_oculos:
		fame_payment *= 1.3
	if get_node("/root/Game").item_dinheiro:
		money_payment *= 2
		
func show_message(recived_message):
	buttons.hide()
	dialog.visible_characters = 0
	dialog.text = recived_message
	timer.start()

func _on_timer_timeout():
	if dialog.visible_characters == dialog.text.length():
		money_payment = randi_range(70, 100)
		fame_payment = randi_range(10, 25)
		update_payment_upgrades()
		money_label.text = str(money_payment)
		fame_label.text = str(fame_payment)
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
	get_node("/root/Game/MainClient/Dialog/Buttons").hide()
	var PC_scene_instantiate = PC_scene.instantiate()
	get_tree().get_root().get_node("/root/Game/MainPC").add_child(PC_scene_instantiate)
	buttons.hide()
	get_node("/root/Game/MainPC/PC/Panel/Mesa/Tasks_panel/Preview/MoneyPrev").text=str(money_payment)
	get_node("/root/Game/MainPC/PC/Panel/Mesa/Tasks_panel/Preview/FamePrev").text=str(fame_payment)

func _on_recusar_pressed():
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").change_sprite(1)
	get_node("/root/Game/HUD/Stats")._remove_fame(-3)
	get_node("/root/Game").is_walking = true
	get_parent().queue_free()
