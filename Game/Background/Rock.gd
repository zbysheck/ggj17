extends Area2D

onready var GameState = get_node("/root/GameState")

func _on_Laska_body_enter( body ):
	if body.get_name() == "Surfer":
		GameState.rockHit()