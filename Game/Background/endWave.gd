extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	
	set_pos(Vector2(get_pos().x + (40 * delta), get_pos().y))