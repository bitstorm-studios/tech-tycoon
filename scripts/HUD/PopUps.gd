extends Marker2D

func money_value (money):
	if money < 0:
		$Money.text = str(money)
	else:
		$Money.text = "+" + str(money)

func fame_value (fame):
	if fame < 0:
		$Fame.text = str(fame)
	else:
		$Fame.text = "+" + str(fame)
