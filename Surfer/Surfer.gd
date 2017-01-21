extends RigidBody2D

var CurrentDirectionVector

var Waves = 0;
var speed = 0;

export(int) var maxSpeed;
var isOnTheWave = false;

func _ready():
	set_process(true)

func _process(delta):
	maxSpeed = 90
	if(isOnWave() && !Input.is_action_pressed("SURF")):
		speed += 0.01
	if(isOnWave() && Input.is_action_pressed("SURF")):
		speed -= 0.009
		CurrentDirectionVector = Vector2(speed, -4)
	else:
		CurrentDirectionVector = Vector2(speed, 2)
	if(isOnWave()):
		set_gravity_scale(0.3)
	else:
		set_gravity_scale(2)
	set_applied_force(CurrentDirectionVector * get_linear_velocity().length())
	var velocity = get_linear_velocity().x
	var velocity_y = get_linear_velocity().y
	if(velocity > maxSpeed):
		set_linear_velocity(Vector2(maxSpeed, get_linear_velocity().y))
	if(velocity < 20):
		set_linear_velocity(Vector2(20, get_linear_velocity().y))
	print(velocity)
	if(velocity_y > 1250):
		set_linear_velocity(Vector2(velocity, 250))
	if(isOnWave() && velocity_y > 60):
		set_linear_velocity(Vector2(velocity, 60))
	
	var P1 = get_node("Movement")
	var P1position = P1.get_global_pos()
	
	if (!isOnWave()):
		P1.play("jump")
	elif (isOnWave()):
		if (-10 < velocity_y && velocity_y < 1):
			P1.play("forward")
		elif (velocity_y > 10):	
			P1.play("45-down")
		elif (velocity_y < -10):
			P1.play("45-up")

func enterWave(wave):
	Waves = Waves + 1
func leaveWave(wave):
	Waves = Waves - 1
func isOnWave():
	if(Waves > 0):
		return true
	else:
		return false