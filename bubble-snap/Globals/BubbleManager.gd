extends Node

var unPoppedBubbleArray = []
var poppedBubbleArray = []

var currPoppedRow : int = -1
var currPoppedCol : int = -1
var lastPopped

func resetBubbles():
	#GameManager.currentPops = 0
	for bubble in poppedBubbleArray:
		bubble.resetState()
		unPoppedBubbleArray.push_back(bubble)
	print("unpopped: ", unPoppedBubbleArray.size())
	poppedBubbleArray.clear()
	
func addPop(button,type):
	unPoppedBubbleArray.erase(button)
	poppedBubbleArray.append(button)
	BoonManager.popEvent(type)
	
func subtractPop(button):
	unPoppedBubbleArray.append(button)
	poppedBubbleArray.erase(button)
	#GameManager.currentPops -= 1
	
func addToUnPopped(button):
	unPoppedBubbleArray.push_back(button)
