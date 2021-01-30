extends RigidBody2D

func _ready():
	connect("body_entered", self, "on_body_entered")

func on_body_entered(body:Node2D):
	if body.has_method("heal50"):
		body.heal50()
	queue_free()

func _physics_process(delta):
	if global_position.y > 1000:
		queue_free()
