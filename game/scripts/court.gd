extends Node2D



func _on_cell_button_pressed():
	get_tree().change_scene_to_file("res://scenes/cell.tscn")


func _on_main_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
