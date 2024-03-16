extends Node2D

func _on_main_button_pressed() -> void:
	#SceneSwitcher.switch_scene("res://scenes/main.tscn")
	get_tree().quit()
