extends KinematicBody2D

var linear_vel = Vector2()
var gravity = 100

onready var playback = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	linear_vel.y += gravity + delta
	linear_vel = move_and_slide(linear_vel, Vector2.UP)
	var on_floor = is_on_floor()
	var target_vel = Vector2(
		Input.get_action_strength("right") 
		- Input.get_action_strength("left"), 0)
	linear_vel.x = lerp(linear_vel.x,target_vel.x * 400,0.5)
	if on_floor and Input.is_action_just_pressed("jump"):
		linear_vel.y -= 1500
	if on_floor:
		if linear_vel.length_squared()>10:
			playback.travel("Run")
		else:
			playback.travel("Idle")
	else:
		if linear_vel.y > 0:
			playback.travel("Fall")
		else:
			playback.travel("Jump_stay")
	if linear_vel.x > 0:
		$Sprite.flip_h = true
	if linear_vel.x < 0:
		$Sprite.flip_h = false
	
