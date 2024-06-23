extends RigidBody2D
class_name Player

var currentAreaIds = [null, null, null, null]
@export var speed = 400
@export var playerIndex: int
@export var moveRightAction = "move_right"
@export var moveLeftAction = "move_left"
@export var moveUpAction = "move_up"
@export var moveDownAction = "move_down"
@export var sprintAction = "sprint"
@export var dashAction = "dash"
@export var actionAction = "action" 

var playerSkins = [
	load("res://assets/player/player_1.tres"), 
	load("res://assets/player/player_2.tres"),
	load("res://assets/player/player_3.tres")
	]

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
	$AnimatedSprite2D.sprite_frames = playerSkins[playerIndex]

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed(moveRightAction):
		velocity.x += 1
	if Input.is_action_pressed(moveLeftAction):
		velocity.x -= 1
	if Input.is_action_pressed(moveDownAction):
		velocity.y += 1
	if Input.is_action_pressed(moveUpAction):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		animate_on_move(velocity)
	else:
		$AnimatedSprite2D.play("Stand")
		
	if Input.is_action_pressed(sprintAction):
		velocity *= 2
		
	if Input.is_action_just_pressed(dashAction):
		velocity *= 5
		
	move_and_collide(velocity * delta)

	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

	if currentAreaIds[playerIndex] != null:
		if Input.is_action_just_pressed(actionAction):
			playInstrument.emit(currentAreaIds[playerIndex])


func onEnteredArea(id):
	currentAreaIds[playerIndex] = id

func onExitedArea():
	currentAreaIds[playerIndex] = null
