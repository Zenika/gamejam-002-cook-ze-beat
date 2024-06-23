extends Node2D


var score = 0

func incrementScore(n: int):
	score += n
	$ValeurScore/Label.text = str(score)
	

