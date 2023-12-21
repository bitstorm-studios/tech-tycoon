extends Control

@export var group : ButtonGroup 

func _on_button_pressed():
	group.get_pressed_button()
	print(group.get_pressed_button())
	group.get_pressed_button().disabled = true
	group.get_pressed_button().scale = Vector2(1.1, 1.1)
