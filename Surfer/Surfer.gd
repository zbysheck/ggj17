extends RigidBody2D

var CurrentDirectionVector
onready var initial_pos = get_pos()
var Waves = 0;
var speed = 0;
var baseMaxSpeed = 190;
var maxSpeed = 0;
var prevX;

var isOnTheWave = false;

onready var pasekTurbo = get_node("Camera2D/CanvasLayer/ProgressBar")
var Turbo = 0;
var TurboDecay = 0.5;

func _ready():
	get_node("/root/GameState").surfer = self;
	set_process(true)

func _process(delta):
	Turbo -= TurboDecay * delta
	if(Turbo < 0):
		Turbo = 0
	pasekTurbo.set_value(Turbo)
	maxSpeed = baseMaxSpeed + Turbo
	var minimalSpeed = 40
	var speedup = 0.0005
	if(isOnWave() && !Input.is_action_pressed("SURF")):
		speed += speedup
	if(isOnWave() && Input.is_action_pressed("SURF")):
		speed -= speedup/2
		CurrentDirectionVector = Vector2(speed, -5)
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
	if(velocity < minimalSpeed):
		set_linear_velocity(Vector2(minimalSpeed, get_linear_velocity().y))
	if(velocity_y > 250):
		set_linear_velocity(Vector2(velocity, 250))
	if(isOnWave() && velocity_y > 60):
		set_linear_velocity(Vector2(velocity, 60))
	print (velocity)
	var P1 = get_node("Movement")
	var P1position = P1.get_global_pos()
	
	if (!isOnWave()):
		get_node("surfingwave").set_z(-1)
		if (Input.is_action_pressed("SURF")):
				P1.play("jump")
		elif (velocity_y < 85 && velocity_y > -85):
			P1.play("Peek")
		elif (velocity_y > 85):	
			P1.play("90-down")
		elif (velocity_y < -85):
			P1.play("90-up")
		
	elif (isOnWave()):
		get_node("surfingwave").set_z(0)
		if (-30 < velocity_y && velocity_y < 30):
			P1.play("forward")
		elif (velocity_y > 30):	
			P1.play("45-down")
		elif (velocity_y < -30):
			P1.play("45-up")
	
	updatePoints(delta)

func enterWave(wave):
	Waves = Waves + 1
func leaveWave(wave):
	Waves = Waves - 1
func isOnWave():
	if(Waves > 0):
		return true
	else:
		return false
		
		
func kill(): 
	set_pos(initial_pos)

func addTurbo(turboVal):
	Turbo += turboVal

func updatePoints(delta):
	if(prevX == null):
		prevX = get_pos().x
	else:
		var points = delta * get_linear_velocity().x * 1/10
		get_node("/root/GameState").addPoints(points)
