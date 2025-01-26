extends Node

var wave = 1

var totalPopsNeeded : float = 10
var currentPops : float = 0

var inWave = false

var mainTimer
var timerLabel
var waveLabel
var nextWaveButton

var totalTime = 60

func startGame():
	mainTimer = get_tree().current_scene.find_child("mainTimer")
	timerLabel = get_tree().current_scene.find_child("timerLabel")
	waveLabel = get_tree().current_scene.find_child("waveLabel")
	nextWaveButton = get_tree().current_scene.find_child("nextWaveButton")
	mainTimer.wait_time = totalTime
	mainTimer.start()
	inWave = true
	
func endWave():
	inWave = false
	mainTimer.stop()
	get_tree().current_scene.find_child("CanvasLayer").add_child(load("res://Cameron/BoonSelection.tscn").instantiate())
	nextWaveButton.show()

func nextWave():
	mainTimer.wait_time = totalTime
	mainTimer.start()
	wave += 1
	BubbleManager.resetBubbles()
	currentPops = 0
	inWave = true
	
func _process(delta: float) -> void:
	totalPopsNeeded = 10
	if currentPops <= totalPopsNeeded and inWave:
		nextWaveButton.hide()
		waveLabel.text = "Wave: " + str(wave)
		timerLabel.text = str("%.2f" % mainTimer.time_left)
	if currentPops >= totalPopsNeeded and inWave:
		endWave()
