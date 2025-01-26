extends Node

var wave = 1

var totalPopsNeeded : float = 20
var currentPops : float = 0

var atStart = true
var inWave = false
var gameLost = false

var mainTimer
var timerLabel
var waveLabel
var nextWaveButton
var popLabel

var totalTime = 60

func startGame():
	mainTimer = get_tree().current_scene.find_child("mainTimer")
	timerLabel = get_tree().current_scene.find_child("timerLabel")
	waveLabel = get_tree().current_scene.find_child("waveLabel")
	nextWaveButton = get_tree().current_scene.find_child("nextWaveButton")
	popLabel = get_tree().current_scene.find_child("PopsLabel")
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
	
func resetGame():
	print("got here")
	atStart = true
	inWave = false
	wave = 0
	#mainTimer.stop()
	mainTimer.wait_time = totalTime
	currentPops = 0
	waveLabel.text = "Wave: " + str(wave)
	timerLabel.text = str("%.2f" % mainTimer.time_left)
	popLabel.text = "Pops Needed: " + str(currentPops) + "/" + str(totalPopsNeeded)
	BubbleManager.resetBubbles()
	BoonManager.resetBoons()
	

func _process(delta: float) -> void:
	if currentPops <= totalPopsNeeded and inWave and not gameLost:
		nextWaveButton.hide()
		waveLabel.text = "Wave: " + str(wave)
		timerLabel.text = str("%.2f" % mainTimer.time_left)
		popLabel.text = "Pops Needed: " + str(currentPops) + "/" + str(totalPopsNeeded)
	if mainTimer != null:
		if mainTimer.time_left <= .02 and inWave and not gameLost:
			gameLost = true
			mainTimer.stop()
			inWave = false
			get_tree().current_scene.find_child("CanvasLayer").add_child(load("res://Elijah/Scenes/GameOverScene.tscn").instantiate())
	if currentPops >= totalPopsNeeded and inWave and not gameLost:
		endWave()
