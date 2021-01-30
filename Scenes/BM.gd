extends RigidBody2D

func _ready():
	connect("body_entered", self, "on_body_entered")

func on_body_entered(body:Node2D):
	$CollisionShape2D/AnimatedSprite.playing=true
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()

func _physics_process(delta):
	if global_position.y > 1000:
		queue_free()
