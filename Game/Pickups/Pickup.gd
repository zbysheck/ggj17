extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var TeqPoints;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	print(TeqPoints)

func _on_Area2D_body_enter( body ):
	if body.get_name() == "Surfer":
		body.addTurbo(1)
		queue_free()


func _on_Area2D_body_exit( body ):
	if ("TeqPoints = null"):
		TeqPoints = 0
	else:
		TeqPoints = TeqPoints + 1
		print(TeqPoints)