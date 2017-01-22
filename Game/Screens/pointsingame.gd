extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func updatePoints(delta):
	var points = delta * get_linear_velocity().x * 1/10
	set_text("Points: " + str(int(points)))