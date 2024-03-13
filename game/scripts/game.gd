extends Node2D


func _on_start_timer_timeout():
	SceneSwitcher.switch_scene("res://scenes/main.tscn")
