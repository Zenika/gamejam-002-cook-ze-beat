extends RigidBody2D

@export var speed = 400
var screen_size
var currentAreaId = null

signal playInstrument(instrument)

func animate_on_move(velocity):
	var isHorizontalyMoved = abs(velocity.x) > abs(velocity.y)
	if isHorizontalyMoved:
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("Walk_side")
		elif velocity.x > 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("Walk_side")
	else:
		if velocity.y < 0:
			$AnimatedSprite2D.play("Walk_back")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("Walk_front")

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
		animate_on_move(velocity)
	else:
		$AnimatedSprite2D.play("Stand")
		
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
			playInstrument.emit(currentAreaId)


func _on_sound_area_enter_sound_area(id):
	currentAreaId = id


func _on_sound_area_exit_sound_area():
	currentAreaId = null
