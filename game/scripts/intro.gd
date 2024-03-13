extends Node2D

func _ready():
	var text = load_intro()
	$CanvasLayer/IntroLabel.text = text

func _on_timer_timeout():
	Start_Game()

func Start_Game():
	SceneSwitcher.switch_scene("res://scenes/cell_manager.tscn")

func load_intro():
	if(FileAccess.file_exists("res://texts/intro.txt")):
		var intro_res = "res://texts/intro.txt"
		var file = FileAccess.open(intro_res, FileAccess.READ)
		return file.get_as_text()
	else:
		return ""
