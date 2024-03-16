extends Node2D

@onready var anim = $AnimationPlayer

const INTRO_FILE = "res://texts/intro.txt"

@onready var timer : Timer = $Timer

func _ready() -> void:
	var text = load_intro()
	var split_text = text.split("-")
	anim.play("fade_out")
	$CanvasLayer/Control/IntroLabel1.text = split_text[0]
	$CanvasLayer/Control/IntroLabel2.text = split_text[1]
	$CanvasLayer/Control/IntroLabel2.hide()
	$CanvasLayer/Control/IntroImage2.hide()
	await get_tree().create_timer(3.0).timeout
	start_intro()

func start_intro():
	anim.play("fade_in")
	await get_tree().create_timer(1.0).timeout
	$CanvasLayer/Control/IntroLabel1.hide()
	$CanvasLayer/Control/IntroLabel2.show()
	$CanvasLayer/Control/IntroImage1.hide()
	$CanvasLayer/Control/IntroImage2.show()
	await get_tree().create_timer(0.5).timeout
	anim.play("fade_out")
	await get_tree().create_timer(3.0).timeout
	Start_Game()

func Start_Game() -> void:
	anim.play("fade_in")
	await get_tree().create_timer(1.0).timeout
	SceneSwitcher.switch_scene("res://scenes/cell_manager.tscn")

func load_intro():
	if(FileAccess.file_exists(INTRO_FILE)):
		var intro_res = INTRO_FILE
		var file = FileAccess.open(intro_res, FileAccess.READ)
		return file.get_as_text()
	else:
		return ""
