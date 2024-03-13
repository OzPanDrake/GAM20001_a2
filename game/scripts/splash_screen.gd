extends Node2D

@onready var start_timer : Timer = $StartTimer

func _ready() -> void:
	start_timer.wait_time = 1
	start_timer.start()

func _on_start_timer_timeout() -> void:
	Start_Game()

func Start_Game() -> void:
	SceneSwitcher.switch_scene("res://scenes/main.tscn")

