extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
	
func _ready():
	var points = get_node("/Pickup").Teqpoints
	set_text("Points: " + str(int(points)))