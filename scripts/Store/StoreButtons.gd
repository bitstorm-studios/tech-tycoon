extends Control

@onready var popup_scene = preload("res://scenes/Store/store_popup.tscn")

@export var group : ButtonGroup 
@export var precoBiblia = 100
@export var precoDinheiros = 100
@export var precoFuradeira = 100
@export var precoMonster = 100
@export var precoOculos = 100
@export var precoBibliaDoDIABO = 100
@export var precoPS5 = 100
@export var precoCUbo = 100

#func _on_button_pressed():
#if get_node("/root/Game").money >= 500:
#		get_node("/root/Game/HUD/Stats")._remove_money(500)
#		group.get_pressed_button().disabled = true
#		
#	elif get_node("/root/Game").money < 500:
#		$Control.show()
#		$Control/AnimationPlayer.play("popup")
#		$Control/Timer.start()
#func _on_timer_timeout():
#	$Control/AnimationPlayer.play_backwards("popup")


func _on_bíblia_pressed():
	#get_node("/root/Game/Store/PopupContainer").open_popup()
	#print("AQUI")
	var popup_instance = popup_scene.instantiate()
	get_node("root/Game/Store/PopupContainer").add_child(popup_instance)
	
