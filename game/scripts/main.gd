extends Node2D

func _on_play_button_pressed() -> void:
	SceneSwitcher.switch_scene("res://scenes/intro.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _input(event : InputEvent) -> void:
	if(event.is_action_pressed("ui_cancel")):
		get_tree().quit()
