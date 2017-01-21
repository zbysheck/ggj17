extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	
<<<<<<< HEAD
	set_pos(Vector2(get_pos().x + 0.67, get_pos().y))
	get_node("Fala1").play("1")
	get_node("Fala2").play("1")
	get_node("Fala3").play("1")
=======
	set_pos(Vector2(get_pos().x + (40 * delta), get_pos().y))
>>>>>>> refs/remotes/origin/master
