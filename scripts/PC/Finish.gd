extends Control

@onready var outtime = get_node("OutTime")

func _on_finish_pressed():
	outtime.start()
	get_node("/root/Game/MainClient/Dialog/Text").no_btn = true
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").reaction()
	get_node("/root/Game/MainClient/Dialog/Text").show_message(get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").message)
	get_node("/root/Game/MainPC/PC").hide()
	get_node("/root/Game/MainClient").show()
	get_node("/root/Game/HUD/Will Hide").show()
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").change_sprite(0)
	get_node("/root/Game/HUD/Stats")._add_money(get_node("/root/Game/MainClient/Dialog/Text").money_payment)
	get_node("/root/Game/HUD/Stats")._add_fame(get_node("/root/Game/MainClient/Dialog/Text").fame_payment)

func _on_out_time_timeout():
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").accepted += 1
	get_node("/root/Game/MainPC/PC").queue_free()
	get_node("/root/Game/MainClient/Dialog").queue_free()
	get_node("/root/Game").is_walking = true
