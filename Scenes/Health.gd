extends Line2D

var decrease = 0.05
signal death

func _decrease():
	points[1].x -= decrease

func _is_dead():
	return points[1].x <= 0


func _on_Timer_timeout():
	_decrease()
	if _is_dead():
		emit_signal("death")
		$Timer.stop()
		$Timer2.start()

func _on_Crabby_damage():
	if points[1].x > 10:
		points[1].x -= 10
	else:
		points[1].x = 0


func _on_Crabby_heal15():
	if not _is_dead():
		if points[1].x <= 56:
			points[1].x += 4
		else:
			points[1].x = 60


func _on_Crabby_heal30():
	if not _is_dead():
		if points[1].x <= 52:
			points[1].x += 8
		else:
			points[1].x = 60


func _on_Crabby_heal50():
	if not _is_dead():
		if points[1].x <= 45:
			points[1].x += 15
		else:
			points[1].x = 60


func _on_Main_warning():
	decrease = 0.15


func _on_Main_safe():
	decrease = 0.05
