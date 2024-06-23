extends Sprite2D

var hit = false
var current_note = null

const SHAKE_MOVEMENT_Y = 5
const SHAKE_MOVEMENT_X = 5

@export var input = ""
signal increment_score(score: int)

func validateInstrument(instrumentLetter):
	_raise_instrument()
	if instrumentLetter == input:
		if current_note != null:
			increment_score.emit(1)
			current_note.destroy()
		_reset()
	else:
		print("loser")
 
func _raise_instrument():
	if !$BumpTimer.is_stopped():
		return
	position.y -= SHAKE_MOVEMENT_Y
	position.x -= SHAKE_MOVEMENT_X
	$BumpTimer.start()
func _lower_instrument():
	position.y += SHAKE_MOVEMENT_Y
	position.x += SHAKE_MOVEMENT_X


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
