extends Node2D

@onready var anim = $AnimationPlayer
@onready var notepad = $CanvasLayer/Control/Notepad/MarginContainer/Panel/VBoxContainer/PadLabel

var questions_array = []
var answers_array = []
var input_answers_array = []
var correct_answers_array = []

func _ready() -> void:
	$EndGameCanvasLayer.hide()
	anim.play("fade_out")
	await get_tree().create_timer(1.0).timeout
	var notepad_text = GlobalSingleton.notepad_text
	notepad.text = notepad_text
	setup_q_and_a()

func setup_q_and_a():
	questions_array.append("Who is the killer? ")
	questions_array.append("Is the killer in the prison with you? ")
	questions_array.append("What was the weapon? ")
	questions_array.append("Where are the bodies? ")
	questions_array.append("What is the name of the witness? ")
	questions_array.append("Is the winness in prison with you? ")
	answers_array.append("Tony")
	answers_array.append("Yes")
	answers_array.append("Shovel")
	answers_array.append("East River")
	answers_array.append("Marty")
	answers_array.append("No")
	for ans in answers_array:
		print(ans)

func _on_main_button_pressed() -> void:
	#SceneSwitcher.switch_scene("res://scenes/main.tscn")
	get_tree().quit()


func _on_button_pressed():
	input_answers_array.append($CanvasLayer/Control/QuestionForm/Label/TextEdit.text)
	input_answers_array.append($CanvasLayer/Control/QuestionForm/Label2/TextEdit.text)
	input_answers_array.append($CanvasLayer/Control/QuestionForm/Label3/TextEdit.text)
	input_answers_array.append($CanvasLayer/Control/QuestionForm/Label4/TextEdit.text)
	input_answers_array.append($CanvasLayer/Control/QuestionForm/Label5/TextEdit.text)
	input_answers_array.append($CanvasLayer/Control/QuestionForm/Label6/TextEdit.text)
	print("ip: " + input_answers_array[0])
	print("ans:" + answers_array[0])
	check_answers()

func check_answers():
	var index = 0
	var correct : bool = true
	for ans in answers_array:
		if(input_answers_array[index].to_lower().contains(answers_array[index].to_lower())):
			print(str(index + 1) + ": Correct")
			correct_answers_array.append(str(index + 1) + ": Correct")
			index += 1
		else:
			correct = false
			print(str(index + 1) + ": Incorrect")
			correct_answers_array.append(str(index + 1) + ": Inorrect")
			index += 1
	if !correct:
		print("Loser!")
		lose()
	else:
		print("Winner!")
		win()

func lose():
	$EndGameCanvasLayer.show()
	$LoseAudioStreamPlayer.play()
	$EndGameCanvasLayer/Control/EndGameLabel.text = correct_answers_array[0] + "\n" + correct_answers_array[1] + "\n" + correct_answers_array[2] + "\n" + correct_answers_array[3] + "\n" + correct_answers_array[4] + "\n" + correct_answers_array[5]
	$EndGameCanvasLayer/Control/EndGameLabel2.text = "You Lose!"
	$EndGameCanvasLayer/Control/EndGameLabel3.text = "You have been EXECUTED!"

func win():
	$EndGameCanvasLayer.show()
	$WinAudioStreamPlayer.play()
	$EndGameCanvasLayer/Control/EndGameLabel.text = correct_answers_array[0] + "\n" + correct_answers_array[1] + "\n" + correct_answers_array[2] + "\n" + correct_answers_array[3] + "\n" + correct_answers_array[4] + "\n" + correct_answers_array[5]
	$EndGameCanvasLayer/Control/EndGameLabel2.text = "You Win!"
	$EndGameCanvasLayer/Control/EndGameLabel3.text = "You have been Freed!"
