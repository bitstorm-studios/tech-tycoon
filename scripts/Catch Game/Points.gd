extends Control

func show_points(points):
	$Score.text = "Pontuação: " + str(points) + "/10"

func show_life(life):
	$Life.text = "Vida: " + str(life) + "/3"
