extends Node2D

func _on_play_button_pressed():
	SceneSwitcher.switch_scene("res://scenes/intro.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		get_tree().quit()
