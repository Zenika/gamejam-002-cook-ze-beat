extends Node2D

signal playInstrument(instrument)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_play_instrument(instrument):
	playInstrument.emit(instrument)
	pass # Replace with function body.
