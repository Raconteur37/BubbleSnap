extends Node

var wave = 1

var totalPopsNeeded : float = 20
var currentPops : float = 0

var atStart = true
var inWave = false
var gameLost = false
var inShop = false

var mainTimer
var timerLabel
var waveLabel
var nextWaveButton
var popLabel
var started = false;

var totalTime = 20
var totalTimeDefault = 20;

func _ready():
	totalTimeDefault = totalTime;

func startGame():
	mainTimer = get_tree().current_scene.find_child("mainTimer")
	timerLabel = get_tree().current_scene.find_child("timerLabel")
	waveLabel = get_tree().current_scene.find_child("waveLabel")
	nextWaveButton = get_tree().current_scene.find_child("nextWaveButton")
	popLabel = get_tree().current_scene.find_child("PopsLabel")
	print(mainTimer)
	totalTime = totalTimeDefault
	mainTimer.wait_time = totalTime
	mainTimer.start()
	inWave = true
	started = true

func nextWave():
	mainTimer.wait_time = totalTime
	mainTimer.start()
	wave += 1
	if wave == 11:
		started = false
		get_tree().change_scene_to_file("res://Elijah/Scenes/WinScene.tscn")
	if wave % 3 == 0:
		totalPopsNeeded += 10;
	BubbleManager.resetBubbles()
	currentPops = 0
	inWave = true
	
func endWave():
	nextWaveButton.find_child("Label").text = "NEXT WAVE"
	inWave = false
	mainTimer.stop()
	get_tree().current_scene.find_child("CanvasLayer").add_child(load("res://Prefabs/BoonSelection.tscn").instantiate())
	nextWaveButton.show()
	
func resetGame():
	'''
	print("got here")
	atStart = true
	inWave = false
	wave = 0
	mainTimer.stop()
	mainTimer.wait_time = totalTime
	waveLabel.text = "Wave: " + str(wave)
	timerLabel.text = str("%.2f" % mainTimer.time_left)
	popLabel.text = "Pops Needed: " + str(currentPops) + "/" + str(totalPopsNeeded)
	BubbleManager.resetBubbles()
	BoonManager.resetBoons()
	'''
	get_tree().change_scene_to_file("res://Elijah/Test.tscn")
	BubbleManager.resetBubbles()
	BoonManager.resetBoons()
	wave = 1
	atStart = true
	inWave = false
	gameLost = false
	started = false
	currentPops = 0
	mainTimer.stop()
	mainTimer.wait_time = totalTime
	waveLabel.text = "Wave: " + str(wave)
	timerLabel.text = str("%.2f" % mainTimer.time_left)
	popLabel.text = "Pops Needed: " + str(currentPops) + "/" + str(totalPopsNeeded)
	

func _process(delta: float) -> void:
	if started:
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
			popLabel.text = "Pops Needed: " + str(currentPops) + "/" + str(totalPopsNeeded)
			endWave()
