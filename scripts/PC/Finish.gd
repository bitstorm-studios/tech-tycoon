extends Control

var happy_larry = load("res://assets/Clients/Happy_Larry.png")
var message = "Muito Obrigado !"
@onready var outtime = get_node("OutTime")

func _on_finish_pressed():
	outtime.start()
	get_node("/root/Game/MainClient/Dialog/Text").no_btn = true
	get_node("/root/Game/MainClient/Dialog/Text").show_message(message)	
	get_node("/root/Game/MainPC/PC").hide()
	get_node("/root/Game/MainClient").show()
	get_node("/root/Game/HUD/Will Hide").show()
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client/Sprite").texture = happy_larry
	
	if get_node("/root/Game/MainPC/PC").failed_tasks == 0:
		get_node("/root/Game/HUD/Stats")._add_money(get_node("/root/Game/MainClient/Dialog/Text").money_payment)
		get_node("/root/Game/HUD/Stats")._add_fame(get_node("/root/Game/MainClient/Dialog/Text").fame_payment)
		
	if get_node("/root/Game/MainPC/PC").failed_tasks == 1:
		get_node("/root/Game/HUD/Stats")._add_money(get_node("/root/Game/MainClient/Dialog/Text").money_payment - (get_node("/root/Game/MainClient/Dialog/Text").money_payment * 0.2))
		get_node("/root/Game/HUD/Stats")._add_fame(get_node("/root/Game/MainClient/Dialog/Text").fame_payment - 1)
		
	if get_node("/root/Game/MainPC/PC").failed_tasks == 2:
		get_node("/root/Game/HUD/Stats")._add_money(get_node("/root/Game/MainClient/Dialog/Text").money_payment - (get_node("/root/Game/MainClient/Dialog/Text").money_payment * 0.4))
		get_node("/root/Game/HUD/Stats")._add_fame(get_node("/root/Game/MainClient/Dialog/Text").fame_payment - 2)

func _on_out_time_timeout():
	get_node("/root/Game/MainPC/PC").queue_free()
	get_node("/root/Game/MainClient/Dialog").queue_free()
	get_node("/root/Game").is_walking = true
