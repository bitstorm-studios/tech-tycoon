extends Control

@onready var score_label = $ScoreLabel
@onready var lifes_label = $LifesLabel

func set_lifes(lifes: int):
	lifes_label.text = "Lifes: " + str(lifes)
	
func add_points(points: int):
	score_label.text = "Score: " + str(points)
