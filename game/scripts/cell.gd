extends Node2D

func _process(_delta: float):
	$TimerLabel.text = "Time Remaining: " + "%s" %  GetTime()

func _on_court_button_pressed():
	SceneSwitcher.switch_scene("res://scenes/court.tscn")


func _on_countdown_timer_timeout():
	SceneSwitcher.switch_scene("res://scenes/court.tscn")

func GetTime():
	var time = round($CountdownTimer.time_left)
	var seconds = int(time)%60
	var minutes = (int(time)/60)%60
	var hours = (int(time)/60)/60
	return "%02d:%02d:%02d" % [hours, minutes, seconds]

func _on_sound_timer_timeout():
	$voice_location/AudioStreamPlayer2D.play()
