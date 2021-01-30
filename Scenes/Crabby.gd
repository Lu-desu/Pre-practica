extends KinematicBody2D

var linear_vel = Vector2()
var gravity = 100
var is_dead = false
var salto = false
var vel = 0
signal damage
signal heal15
signal heal30
signal heal50

onready var playback = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	linear_vel.y += gravity + delta
	linear_vel = move_and_slide(linear_vel, Vector2.UP)
	if is_dead==false:
		var on_floor = is_on_floor()
		var target_vel = Vector2(vel, 0)
		linear_vel.x = lerp(linear_vel.x,target_vel.x * 400,0.5)
		if on_floor and salto == true:
			linear_vel.y -= 1500
			salto=false
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
	else:
		linear_vel.x=0

func _on_Health_death() -> void:
	$AnimationTree.active = false
	$AnimationPlayer.play("Death")
	$Death.play()
	is_dead = true
	
func heal15():
	$Drop.play()
	emit_signal("heal15")

func heal50():
	$Drop.play()
	emit_signal("heal50")
	
func heal30():
	$Drop.play()
	emit_signal("heal30")
	
func take_damage():
	$Damage.play()
	emit_signal("damage")


func _on_Izquierda_button_down():
	$Run.play()
	vel = -1

func _on_Izquierda_button_up():
	$Run.stop()
	vel = 0

func _on_Derecha_button_down():
	$Run.play()
	vel = 1

func _on_Derecha_button_up():
	$Run.stop()
	vel = 0


func _on_Salto_button_down():
	$Jump.play()
	salto = true
