extends Area2D

@export var areaId = "A"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body):
	if body is Player:
		body.onEnteredArea(areaId)

func _on_body_exited(body):
	if body is Player:
		body.onExitedArea()
