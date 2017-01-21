extends Node

var path = "res://Game/EndlessRunner/"
var endlessRunnerTiles = [];

func _enter_tree():
	randomize()
	readTileScenes()

func readTileScenes():
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			var readScene = load(path + file_name)
			if(readScene != null):
				endlessRunnerTiles.append(readScene)
			else:
				print("cant read " + str(path + file_name))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")

func createSegment(currentSegment):
	var index = (randi() % endlessRunnerTiles.size())
	var newSegment = endlessRunnerTiles[index].instance()
	newSegment.set_frame(currentSegment.get_frame())
	currentSegment.get_node("..").add_child(newSegment)
	var segmentPos = currentSegment.get_node("BlockEnd").get_pos()
	var segmentBegin = newSegment.get_node("BlockBegin").get_pos()
	var xPos = segmentPos.x - segmentBegin.x
	newSegment.set_pos(Vector2(xPos + currentSegment.get_pos().x, currentSegment.get_pos().y))