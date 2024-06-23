extends Node

var soundLucas = preload("res://assets/sounds/cook-ze-beat-lucas.wav")
var soundNirina = preload("res://assets/sounds/cook-ze-beat-nirina.wav")
var soundPops = preload("res://assets/sounds/cook-ze-beat-pops.wav")

var sounds = [soundLucas, soundNirina, soundPops]

# Called when the node enters the scene tree for the first time.
func _ready():
	var soundToPlay = sounds.pick_random()
	$AudioStreamPlayer2D.stream = soundToPlay
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
