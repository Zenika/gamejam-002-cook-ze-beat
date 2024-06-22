extends AnimatedSprite2D

var hit = false
var current_note = null

@export var input = ""
signal increment_score(score: int)

func validateInstrument(instrumentLetter):
	print("Bonjour les amours " + str(instrumentLetter))
	if instrumentLetter == input:
		if current_note != null:
			# Mettre un signal ici
			increment_score.emit(1)
			current_note.destroy()
		_reset()
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _on_HitArea_area_entered(area):
	if area.is_in_group("note"):
		hit = true
		current_note = area
		
func _on_HitArea_area_exited(area):
	if area.is_in_group("note"):
		hit = false
		current_note = null
		
func _reset():
	current_note = null
	hit = false


func _on_PushTimer_timeout():
	frame = 0
