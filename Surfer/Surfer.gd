extends RigidBody2D

var CurrentDirectionVector

export(int) var maxSpeed;

func _ready():
	set_process(true)

func _process(delta):
	if(Input.is_action_pressed("SURF")):
		CurrentDirectionVector = Vector2(1, -6)
		set_gravity_scale(0.05)
	else:
		CurrentDirectionVector = Vector2(1, 1)
		set_gravity_scale(1)
	set_applied_force(CurrentDirectionVector * get_linear_velocity().length())
	var velocity = get_linear_velocity().x
	if(velocity > maxSpeed):
		set_linear_velocity(Vector2(maxSpeed, get_linear_velocity().y))