extends Area2D

func _on_body_entered(body):
	if body is Player:
		body.setIsInRiver(true);


func _on_body_exited(body):
	if body is Player:
		body.setIsInRiver(false);
