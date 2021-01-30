extends Node2D

var dead = false
signal warning
signal safe

func _ready():
	pass

func _on_Timer_timeout():
	if Gamehandler.hora == 12 and Gamehandler.minuto == 30:
		emit_signal("warning")
		$"warning-emoji".visible = true
	if Gamehandler.hora == 4:
		emit_signal("safe")
		$"warning-emoji".visible = false
	if Gamehandler.hora == 12:
		$Nublado/Dia.show_behind_parent = false
	if Gamehandler.hora == 6:
		$Nublado/Dia/Tarde.show_behind_parent = false
	if dead == false:
		Gamehandler.minuto += 1
		Gamehandler.reloj_update()
	if Gamehandler.hora == 8:
		get_tree().change_scene("res://Scenes/Victoria.tscn")
		Gamehandler.hora = 9
		Gamehandler.minuto = 0
		Gamehandler.am_pm = "am"
		$Nublado/Dia.show_behind_parent = true
		$Nublado/Dia/Tarde.show_behind_parent = true


func _on_Health_death():
	dead = true

func _on_Timer2_timeout():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	Gamehandler.hora = 9
	Gamehandler.minuto = 0
	Gamehandler.am_pm = "am"
	$Nublado/Dia.show_behind_parent = true
	$Nublado/Dia/Tarde.show_behind_parent = true
