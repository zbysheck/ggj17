extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process_input(true)

func _input(event):
	if(event.is_action_pressed("SURF") && !event.is_echo()):
		get_node("/root/GameState").changeToMainScreen()
