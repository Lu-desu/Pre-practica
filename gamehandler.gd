extends Node

var hora = 9
var minuto = 00
var am_pm = "am"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reloj_update():
	if minuto == 60:
		if hora == 12:
			hora = 1
			minuto = 0
		elif hora == 11:
			hora += 1
			minuto = 0
			am_pm = "pm"
		else:
			hora += 1
			minuto = 0
	if minuto == 0:
		get_tree().get_nodes_in_group("tiempo")[0].text = String(hora) + ":00" + am_pm
	elif minuto < 10:
		get_tree().get_nodes_in_group("tiempo")[0].text = String(hora) + ":0" + String(minuto) + am_pm
	else:
		get_tree().get_nodes_in_group("tiempo")[0].text = String(hora) + ":" + String(minuto) + am_pm
		
