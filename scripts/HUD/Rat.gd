extends Button

var is_open = false
@onready var parent = self.get_parent()

func _on_pressed():
	if not is_open:
		parent.play()
		is_open = true
	else:
		parent.play_backwards()
		is_open = false

