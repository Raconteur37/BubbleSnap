extends Node

var wave = 1

var totalPopsNeeded : float = 20
var currentPops : float = 0

var inWave = false
var gameLost = false

var mainTimer
var timerLabel
var waveLabel
var nextWaveButton
var popLabel

var totalTime = 20

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
	
func _process(delta: float) -> void:
	if currentPops <= totalPopsNeeded and inWave and not gameLost:
		nextWaveButton.hide()
		waveLabel.text = "Wave: " + str(wave)
		timerLabel.text = str("%.2f" % mainTimer.time_left)
		popLabel.text = "Pops Needed: " + str(currentPops) + "/" + str(totalPopsNeeded)
	if mainTimer != null:
		if mainTimer.time_left <= .01 and inWave:
			gameLost = true
			get_tree().change_scene_to_file("res://Elijah/Scenes/GameOverScene.tscn")
	if currentPops >= totalPopsNeeded and inWave and not gameLost:
		endWave()
