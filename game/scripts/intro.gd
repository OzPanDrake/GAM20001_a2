extends Node2D

const INTRO_FILE = "res://texts/intro.txt"

@onready var timer : Timer = $Timer

func _ready() -> void:
	var text = load_intro()
	$CanvasLayer/Control/IntroLabel1.text = text
	$CanvasLayer/Control/IntroLabel2.text = text
	$CanvasLayer/Control/IntroLabel1.hide()
	$CanvasLayer/Control/IntroLabel2.hide()
	$CanvasLayer/Control/IntroImage1.hide()
	$CanvasLayer/Control/IntroImage2.hide()
	timer.wait_time = 10
	timer.start()

func _on_timer_timeout() -> void:
	Start_Game()

func Start_Game() -> void:
	SceneSwitcher.switch_scene("res://scenes/cell_manager.tscn")

func load_intro():
	if(FileAccess.file_exists(INTRO_FILE)):
		var intro_res = INTRO_FILE
		var file = FileAccess.open(intro_res, FileAccess.READ)
		return file.get_as_text()
	else:
		return ""
