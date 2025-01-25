extends Node

var wave = 0

var inWave = false

var mainTimer
var timerLabel

func calculateTime():
	return 60

func startGame():
	mainTimer = get_tree().current_scene.find_child("mainTimer")
	timerLabel = get_tree().current_scene.find_child("timerLabel")
	mainTimer.wait_time = calculateTime()
	mainTimer.start()
	inWave = true
	
func _process(delta: float) -> void:
	if inWave:
		timerLabel.text = str("%.2f" % mainTimer.time_left)
