extends Sprite2D

var perfect = false
var good = false
var okay = false

var current_note = null

const PERFECT_POINTS = 3
const GOOD_POINTS = 2
const OKAY_POINTS = 1

@export var input = ""
signal increment_score(score: int)

func validateInstrument(instrumentLetter):

	if instrumentLetter == input:
		if current_note != null:
			winPoints()
		else:
			# Quand on tape pas au bon moment
			losePoints()
			$AudioStreamPlayer2D.play()
		_reset()
	else:
		losePoints()
		print("loser")

func winPoints():
	if perfect:
		increment_score.emit(PERFECT_POINTS)
		current_note.destroy(PERFECT_POINTS)
	elif good:
		increment_score.emit(GOOD_POINTS)
		current_note.destroy(GOOD_POINTS)
	elif okay:
		increment_score.emit(OKAY_POINTS)
		current_note.destroy(OKAY_POINTS)
	

func losePoints():

	increment_score.emit(-1)


		
func _reset():
	current_note = null

	perfect = false
	good = false
	okay = false


func _on_PushTimer_timeout():
	frame = 0


func _on_perfect_area_area_entered(area):
	if area.is_in_group("note"):
		perfect = true


func _on_perfect_area_area_exited(area):
	if area.is_in_group("note"):
		perfect = false


func _on_good_area_area_entered(area):
	if area.is_in_group("note"):
		good = true

func _on_good_area_area_exited(area):
	if area.is_in_group("note"):
		good = false

func _on_okay_area_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		current_note = area


func _on_okay_area_area_exited(area):
	if area.is_in_group("note"):
		losePoints()
		okay = false
		current_note = null
	
