extends Sprite

onready var creationPos = get_node("../CreationPos")
onready var creationTrigger = get_node("../Trigger")
onready var background = get_node("..")
onready var scene = preload("res://Game/Background/Wave.tscn")

func _ready():
	set_process(true)

func _process(delta):
	pass

func _on_Area2D_body_enter( body ):
	if(body.get_name() == "Surfer"):
		body.enterWave()


func _on_Area2D_body_exit( body ):
	if(body.get_name() == "Surfer"):
		body.leaveWave()

func createNextSegment():
	var newSegment = scene.instance()
	var segmentPos = newSegment.get_pos()
	var segmentBegin = newSegment.get_node("BlockBegin")
	
	