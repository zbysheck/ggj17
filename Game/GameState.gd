extends Node

onready var gameOverScene = preload("res://Game/Screens/GameOver.tscn")
onready var titleScreen = preload("res://Game/Screens/TitleScreen.tscn")

var TeqPoints = 0;
var points = 0;
var surfer;

func rockHit():
	get_tree().change_scene("res://Game/Screens/GameOver.tscn")
func SharkHit():
	get_tree().change_scene("res://Game/Screens/SharkOver.tscn")
func changeToMainScreen():
	get_tree().change_scene("res://Game/Screens/TitleScreen.tscn")
	resetPoints()
func changeToGameScreen():
	get_tree().change_scene("res://Game/MainScene.tscn")
func addPoints(points):
	self.points += points
func resetPoints():
	points = 0
func addTeqila(TeqPoints):
	self.TeqPoints += TeqPoints
func resetTeqila():
	points = 0