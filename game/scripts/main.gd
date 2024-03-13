extends Node2D

func _on_play_button_pressed():
	SceneSwitcher.switch_scene("res://scenes/intro.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
