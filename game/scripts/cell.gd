extends Node2D

#const AUDIO_IMPORT = preload("res://scripts/GDScriptAudioImport.gd")

@onready var cd_timer : Timer = $CountdownTimer
@onready var voice_timer : Timer = $SoundTimer
@onready var hide_line_timer : Timer = $HideLineTimer

var rng = RandomNumberGenerator.new()
var bs_array = []				# The written bs lines
var main_array = []				# The written main lines
var voice_location = []			# Location of all voice nodes in the cell scene
var bs_voices_array = []		# The spoken bs lines
var main_voices_array = []		# the spoken main lines
var line : Label				# the current label node

func _ready() -> void:
	setup_timers()
	call_deferred("setup_arrays")

func _process(_delta: float) -> void:
	$TimerLabel.text = "Time Remaining: " + "%s" %  GetTime()
	#print_debug(bs_array.size())

func setup_timers():
	cd_timer.wait_time = 300
	voice_timer.wait_time = 5
	hide_line_timer.wait_time = 2
	cd_timer.start()
	voice_timer.start()

func setup_arrays():
	bs_array.append_array(GlobalSingleton.bs_array)
	main_array.append_array(GlobalSingleton.main_array)
	var voice_file
	var location
	var index = 1
	while(index <= 8):
		location = "Voices/voice" + str(index) + "/AudioStreamPlayer2D"
		voice_location.append(location)
		index += 1
	index = 1
	while(index < bs_array.size()):
		voice_file = "res://sounds/voice/bs_lines/bs_voice_" + str(index) + ".mp3"
		bs_voices_array.append(voice_file)
		index += 1

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
	var index
	var sound_node : AudioStreamPlayer2D
	rng.randomize()
	index = rng.randi_range(0, 7)
	line = get_node("LinesCanvasLayer/line" + str(index + 1))
	sound_node = get_node(voice_location[index])
	rng.randomize()
	index = rng.randi_range(0, 19)
	line.text = bs_array[index]
	print_debug(bs_array[index])
	var sound_path = bs_voices_array[index]
	print_debug(bs_voices_array[index])
	var file = FileAccess.open(sound_path, FileAccess.READ)
	var buffer = file.get_buffer(file.get_length())
	var stream = AudioStreamMP3.new()
	stream.data = buffer
	sound_node.stream = stream
	sound_node.play()
	hide_line_timer.start()

func _on_hide_line_timer_timeout() -> void:
	line.text = ""
