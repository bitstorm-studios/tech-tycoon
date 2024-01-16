extends Sprite2D

var sprites = ["res://assets/Cross Road/TopDown Vehicles v1.17/Onibus Amarelo.png",
"res://assets/Cross Road/TopDown Vehicles v1.17/Onibus Azul.png"]

func _ready():
	self.texture = load(sprites.pick_random())
