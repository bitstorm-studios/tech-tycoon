extends NinePatchRect

@onready var dialog = $RichTextLabel
@onready var timer = $Timer
var message = "Olá, meu computador está muito lento, quero que você formate ele e instale uma nova memória RAM."

func _input(event):
	if event is InputEventKey or InputEventMouseButton:
		dialog.visible_characters = dialog.text.length()
		
func show_message():
	dialog.visible_characters = 0
	dialog.text = message
	timer.start()

func _on_timer_timeout():
	if dialog.visible_characters == dialog.text.length():
		pass
	dialog.visible_characters += 1
