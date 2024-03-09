extends Node2D



func _on_cell_button_pressed():
	get_tree().change_scene_to_file("res://cell.tscn")
