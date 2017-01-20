extends Sprite

onready var creationPos = get_node("../CreationPos")
onready var creationTrigger = get_node("../Trigger")
onready var background = get_node("..")
onready var scene = preload("res://Game/Background/Wave.tscn")

func _ready():
	set_process(true)

func _process(delta):
	var pos = get_pos()
	set_pos(Vector2(pos.x - 20, pos.y))
	pos = get_pos()
	if(pos.x <= creationTrigger.get_pos().x):
		var newWave = scene.instance()
		background.add_child(newWave)
		newWave.set_pos(Vector2(creationPos.get_pos().x, pos.y))
		free()