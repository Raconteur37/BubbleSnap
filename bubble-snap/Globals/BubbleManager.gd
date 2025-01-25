extends Node

var bubbleArray = []

var inWave : bool = false

var totalPopsNeeded : float = 81
var currentPops : float = 0

var currPoppedRow : int = -1
var currPoppedCol : int = -1

func addPop():
	currentPops += 1
	BoonManager.popEvent()
	
func subtractPop():
	currentPops -= 1

func _process(delta: float) -> void:
	if currentPops >= totalPopsNeeded and inWave:
		print("win")
		inWave = false
