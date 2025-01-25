extends Node

var bubbleArray = []

var inWave : bool = false

var totalPopsNeeded : int = 1
var currentPops : int = 0

var currPoppedRow : int = -1
var currPoppedCol : int = -1

func addPop():
	currentPops += 1
	
func subtractPop():
	currentPops -= 1

func _process(delta: float) -> void:
	if currentPops >= totalPopsNeeded and inWave:
		print("win")
		inWave = false
