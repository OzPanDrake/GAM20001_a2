extends Node2D

const INTRO_FILE = "res://texts/intro.txt"

func _ready():
	var text = load_intro()
	$CanvasLayer/IntroLabel.text = text

func _on_timer_timeout():
	Start_Game()

func Start_Game():
	SceneSwitcher.switch_scene("res://scenes/cell_manager.tscn")

func load_intro():
	if(FileAccess.file_exists(INTRO_FILE)):
		var intro_res = INTRO_FILE
		var file = FileAccess.open(intro_res, FileAccess.READ)
		return file.get_as_text()
	else:
		return ""
