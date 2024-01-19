extends Control

func _ready():
	$Panel/Timer.start()
	get_node("/root/Game/MainPC/PC").sucess = true

func _on_timer_timeout():
	get_tree().paused = false
	get_node("/root/Game/CatchGame").queue_free()
	get_node("/root/Game/HUD").show()
	get_node("/root/Game/MainPC/PC").show()
