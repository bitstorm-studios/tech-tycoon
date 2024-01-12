extends Sprite2D

var sprites = ["res://assets/Cross Road/TopDown Vehicles v1.17/Ambulancia.png" ,
"res://assets/Cross Road/TopDown Vehicles v1.17/Caminhão Marrom.png", 
"res://assets/Cross Road/TopDown Vehicles v1.17/Caminhão Vermelho.png"]

func _ready():
	self.texture = load(sprites.pick_random())
