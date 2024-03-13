extends Node2D



func _on_cell_button_pressed():
	SceneSwitcher.switch_scene("res://scenes/cell_manager.tscn")


func _on_main_button_pressed():
	SceneSwitcher.switch_scene("res://scenes/main.tscn")
