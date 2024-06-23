extends Node2D

signal playInstrument(instrument)

func _on_player_play_instrument(instrument):
	playInstrument.emit(instrument)
