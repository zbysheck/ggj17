extends Area2D

func _on_Rock_body_enter( body ):
	if body.get_name() == "Surfer":
		