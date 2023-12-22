extends Control

var happy_larry = load("res://assets/Clients/Happy_Larry.png")
var message = "Muito Obrigado !"
@onready var outtime = get_node("OutTime")

func _on_finish_pressed():
	outtime.start()
	get_node("/root/Game/MainClient/Dialog/Text").no_btn = true
	get_node("/root/Game/MainClient/Dialog/Text").show_message(message)	
	get_parent().hide()
	get_node("/root/Game/MainClient").show()
	get_node("/root/Game/HUD/Will Hide").show()
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client/Sprite").texture = happy_larry
	
	get_node("/root/Game/HUD/Stats")._add_money(get_node("/root/Game/MainClient/Dialog/Text").money_payment)
	get_node("/root/Game/HUD/Stats")._add_fame(get_node("/root/Game/MainClient/Dialog/Text").fame_payment)

func _on_out_time_timeout():
	get_parent().queue_free()
	get_node("/root/Game/MainClient/Dialog").queue_free()
	get_node("/root/Game").is_walking = true
