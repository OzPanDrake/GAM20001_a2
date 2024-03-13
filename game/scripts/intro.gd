extends Node2D

func _ready():
	var intro_res = "res://texts/intro.txt"
	var file = FileAccess.open(intro_res, FileAccess.READ)
	var text = file.get_as_text()
	$CanvasLayer/IntroLabel.text = text


func _on_timer_timeout():
	Start_Game()

func Start_Game():
	SceneSwitcher.switch_scene("res://scenes/cell_manager.tscn")
