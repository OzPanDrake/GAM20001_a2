extends Node2D



func _on_court_button_pressed():
	get_tree().change_scene_to_file("res://court.tscn")


func _on_main_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
