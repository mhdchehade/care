extends Node

func _ready():
	pass


func _on_ToolButton_pressed():
	loadLevel()

func loadLevel():
	get_tree().change_scene("Game.tscn")