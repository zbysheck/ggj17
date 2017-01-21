extends AnimatedSprite

onready var background = get_node("..")
onready var scene = preload("res://Game/Background/tlo.tscn")

func _ready():
	pass

func createNextSegment():
	print("created segment 2")
	var newBack = scene.instance()
	newBack.set_frame(self.get_frame())
	get_node("..").add_child(newBack)
	var BackPos = get_node("BlockEnd1").get_pos()
	var BackBegin = newBack.get_node("BlockBegin1").get_pos()
	var xPosB = BackPos.x - BackBegin.x
	newBack.set_pos(Vector2(xPosB + get_pos().x, get_pos().y))


func _on_VisibilityNotifier2D_exit_screen():
	queue_free()

func _on_VisibilityNotifier2D_enter_screen():
	createNextSegment()
