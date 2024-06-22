extends Area2D

const TARGET_X = 88
const SPAWN_X = 1000
const DIST_TO_TARGET = TARGET_X - SPAWN_X

const TOP_LANE_SPAWN = Vector2(SPAWN_X, 80)
const MID_LANE_SPAWN = Vector2(SPAWN_X, 212)
const BOTTOM_LANE_SPAWN = Vector2(SPAWN_X, 344)

var speed = 0
var hit = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !hit:
		position.x += speed * delta
		if position.x < 0:
			queue_free()
	else:
		$Node2D.position.y -= speed * delta

func initialize(lane):
	if lane == 0:
		position = TOP_LANE_SPAWN
	elif lane == 1:
		position = MID_LANE_SPAWN
	elif lane == 2:
		position = BOTTOM_LANE_SPAWN
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
		
	speed = DIST_TO_TARGET / 2.0
	
func destroy():
	$CPUParticles2D.emitting = true
	$AnimatedSprite2D.visible = false
	$Timer.start()
	hit = true
	$Node2D/Label.text = "BRAVO"
	$Node2D/Label.modulate = Color('f6d6bd')
	
func _on_Timer_timeout():
	queue_free()
