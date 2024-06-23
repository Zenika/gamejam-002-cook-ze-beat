extends Node2D


var score = 0

func incrementScore(n: int):
	score += n
	$ScoreNode/Label.text = "Score\n" + str(score)
	

