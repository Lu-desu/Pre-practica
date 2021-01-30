extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Volver_a_Jugar_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Inicio_pressed():
	get_tree().change_scene("res://Scenes/Titlescreen.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Instrucciones.tscn")
