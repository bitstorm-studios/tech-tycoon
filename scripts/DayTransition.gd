extends Control

func change_day(day):
	get_tree().paused = true
	$Panel/Label.text = "Dia " + str(day)
	$Timer.start()	

func _on_timer_timeout():
	get_tree().paused = false
