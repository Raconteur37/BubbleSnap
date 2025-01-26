extends Node

var unPoppedBubbleArray = []
var poppedBubbleArray = []

var currPoppedRow : int = -1
var currPoppedCol : int = -1

func resetBubbles():
	GameManager.currentPops = 0
	for bubble in poppedBubbleArray:
		bubble.resetState()
		unPoppedBubbleArray.push_back(bubble)
	poppedBubbleArray.clear()

func addPop(button):
	unPoppedBubbleArray.erase(button)
	poppedBubbleArray.append(button)
	GameManager.currentPops += 1
	BoonManager.popEvent()
	
func subtractPop():
	GameManager.currentPops -= 1
	
func addToUnPopped(button):
	unPoppedBubbleArray.push_back(button)
