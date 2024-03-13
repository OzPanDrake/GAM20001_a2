extends Node2D



func _on_timer_timeout():
	Start_Game()

func Start_Game():
	get_tree().change_scene_to_file("res://scenes/cell_manager.tscn")
