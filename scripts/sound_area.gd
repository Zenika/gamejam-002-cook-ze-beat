extends Area2D

@export var areaId = "A"
signal enterSoundArea(id: String)
signal exitSoundArea()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body):
	body.onEnteredArea(areaId)



func _on_body_exited(body):
	body.onExitedArea()
