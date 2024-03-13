extends Node2D



func _on_timer_timeout():
	Start_Game()

func Start_Game():
	SceneSwitcher.switch_scene("res://scenes/cell_manager.tscn")
