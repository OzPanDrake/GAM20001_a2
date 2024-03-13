extends Node2D

@onready var cd_timer : Timer = $CountdownTimer
@onready var voice_timer : Timer = $SoundTimer

var voices_array = []
var rng = RandomNumberGenerator.new()
var index

func _ready() -> void:
	cd_timer.wait_time = 300
	cd_timer.start()
	voice_timer.wait_time = 2
	voice_timer.start()
	voices_array = [$Voices/voice1/AudioStreamPlayer2D, $Voices/voice2/AudioStreamPlayer2D, $Voices/voice3/AudioStreamPlayer2D, $Voices/voice4/AudioStreamPlayer2D, $Voices/voice5/AudioStreamPlayer2D, $Voices/voice6/AudioStreamPlayer2D, $Voices/voice7/AudioStreamPlayer2D, $Voices/voice8/AudioStreamPlayer2D]

func _process(_delta: float) -> void:
	$TimerLabel.text = "Time Remaining: " + "%s" %  GetTime()

func _on_court_button_pressed() -> void:
	SceneSwitcher.switch_scene("res://scenes/court.tscn")

func _on_countdown_timer_timeout() -> void:
	SceneSwitcher.switch_scene("res://scenes/court.tscn")

func GetTime():
	var time = round(cd_timer.time_left)
	var seconds = int(time)%60
	var minutes = (int(time)/60)%60
	var hours = (int(time)/60)/60
	return "%02d:%02d:%02d" % [hours, minutes, seconds]

func _on_sound_timer_timeout() -> void:
	rng.randomize()
	index = rng.randi_range(0, 7)
	voices_array[index].play()
	print_debug(index)
