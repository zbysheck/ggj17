func _ready():
	var points = get_node("/root/GameState").points
	set_text("Collect: ")