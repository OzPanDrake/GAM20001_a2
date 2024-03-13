extends Node2D

@onready var start_timer : Timer = $StartTimer

func _ready():
	start_timer.wait_time = 1
	start_timer.start()

func _on_start_timer_timeout():
	Start_Game()

func Start_Game():
	SceneSwitcher.switch_scene("res://scenes/main.tscn")

