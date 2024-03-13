extends Node2D

func _on_start_timer_timeout():
	Start_Game()

func Start_Game():
	SceneSwitcher.switch_scene("res://scenes/main.tscn")

