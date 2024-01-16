extends Control

func _ready():
	$Panel/Timer.start()
	
func _on_timer_timeout():
	get_tree().paused = false
	get_node("/root/Game/CatchGame").queue_free()
	get_node("/root/Game/HUD").show()
