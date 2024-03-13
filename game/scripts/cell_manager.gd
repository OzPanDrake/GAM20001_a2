extends Node

class_name  CellManager

signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)


# Called when the node enters the scene tree for the first time.
func _ready():
	load_bs_lines()
	load_main_lines()

## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused

func load_bs_lines():
	if(FileAccess.file_exists("res://texts/bs_lines.txt")):
		var bs_lines_res = "res://texts/bs_lines.txt"
		var bs_file = FileAccess.open(bs_lines_res, FileAccess.READ)
		var bs_text = bs_file.get_as_text()
		print_debug(bs_text)

func load_main_lines():
	if(FileAccess.file_exists("res://texts/main_lines.txt")):
		var main_lines_res = "res://texts/main_lines.txt"
		var main_file = FileAccess.open(main_lines_res, FileAccess.READ)
		var main_text = main_file.get_as_text()
		print_debug(main_text)
