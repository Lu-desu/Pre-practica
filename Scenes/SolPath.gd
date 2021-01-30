extends PathFollow2D

export var SolSpeed = 1

func _process(delta):
	set_offset(get_offset() + SolSpeed * delta)


