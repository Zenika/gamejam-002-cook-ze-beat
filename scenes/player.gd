extends RigidBody2D

@export var speed = 400
var screen_size
var currentAreaId = null

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
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
		
	if Input.is_action_pressed("sprint"):
		velocity *= 2
		
	if Input.is_action_just_pressed("dash"):
		velocity *= 5
		
	move_and_collide(velocity * delta)

	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

	if currentAreaId != null:
		if Input.is_action_just_pressed("action"):
			print("it works!", currentAreaId)


func _on_sound_area_enter_sound_area(id):
	print("in")
	currentAreaId = id


func _on_sound_area_exit_sound_area():
	print("out")	
	currentAreaId = null
