extends Control

@export var group : ButtonGroup 

func _on_button_pressed():
	if get_node("/root/Game").money >= 500:
		get_node("/root/Game/HUD/Stats")._remove_money(500)
		group.get_pressed_button().disabled = true
		
	elif get_node("/root/Game").money < 500:
		$Control.show()
		$Control/AnimationPlayer.play("popup")
		$Control/Timer.start()

func _on_timer_timeout():
	$Control/AnimationPlayer.play_backwards("popup")
