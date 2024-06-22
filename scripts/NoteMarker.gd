extends AnimatedSprite2D

var hit = false
var current_note = null

@export var input = ""

func _unhandled_input(event):
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			if current_note != null:
				# Mettre un signal ici
				get_parent().increment_score(1)
				current_note.destroy()
			_reset()
		else:
			get_parent().increment_score(0)
	if event.is_action_pressed(input):
		frame = 1
	elif event.is_action_released(input):
		$PushTimer.start()


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
