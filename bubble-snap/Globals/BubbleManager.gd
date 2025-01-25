extends Node

var unPoppedBubbleArray = []
var poppedBubbleArray = []


var inWave : bool = false

var totalPopsNeeded : float = 81
var currentPops : float = 0

var currPoppedRow : int = -1
var currPoppedCol : int = -1

func addPop(button):
	unPoppedBubbleArray.erase(button)
	poppedBubbleArray.append(button)
	currentPops += 1
	BoonManager.popEvent()
	
func subtractPop():
	currentPops -= 1
	
func addToUnPopped(button):
	unPoppedBubbleArray.push_back(button)

func _process(delta: float) -> void:
	if currentPops >= totalPopsNeeded and inWave:
		print("win")
		inWave = false
