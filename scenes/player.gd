extends RigidBody2D

@export var speed = 400
var screen_size
var inArea

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	move_and_collide(velocity * delta)

	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

	if inArea != null:
		if Input.is_action_just_pressed("action"):
			print("it works!", inArea)



func _on_sound_area_enter_sound_area(id):
	print("in")
	inArea = id
	pass # Replace with function body.


func _on_sound_area_exit_sound_area():
	print("out")	
	inArea = null
	pass # Replace with function body.
