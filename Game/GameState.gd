extends Node

onready var gameOverScene = preload("res://Game/Screens/GameOver.tscn")
onready var titleScreen = preload("res://Game/Screens/TitleScreen.tscn")

var points = 0;
var surfer;

func rockHit():
	get_tree().change_scene("res://Game/Screens/GameOver.tscn")
func changeToMainScreen():
	get_tree().change_scene("res://Game/Screens/TitleScreen.tscn")
func changeToGameScreen():
	get_tree().change_scene("res://Game/MainScene.tscn")