extends AnimatedSprite

onready var background = get_node("..")
onready var scene = preload("res://Game/Background/Wave.tscn")
onready var EndlessRunnerGenerator = get_node("/root/EndlessRunner")

func _ready():
	pass

func _on_Area2D_body_enter( body ):
	if(body.get_name() == "Surfer"):
		body.enterWave(self)

func _on_Area2D_body_exit( body ):
	if(body.get_name() == "Surfer"):
		body.leaveWave(self)

func createNextSegment():
	print("created segment")
	var newSegment = scene.instance()
	newSegment.set_frame(self.get_frame())
	get_node("..").add_child(newSegment)
	var segmentPos = get_node("BlockEnd").get_pos()
	var segmentBegin = newSegment.get_node("BlockBegin").get_pos()
	var xPos = segmentPos.x - segmentBegin.x
	newSegment.set_pos(Vector2(xPos + get_pos().x, get_pos().y))

func _on_VisibilityNotifier2D_exit_screen():
	queue_free()

func _on_VisibilityNotifier2D_enter_screen():
	EndlessRunnerGenerator.createSegment(self)
