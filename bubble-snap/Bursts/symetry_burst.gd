extends PanelContainer

var activateType = ["Player Pop", "Pop"]
var animationPlayer

var thresh = 3

var inRowCounter = 0

var previousRow = -1

var rowButtons = []

func _ready() -> void:
	BoonManager.addBurst(self)
	animationPlayer = $AnimationPlayer

func activate():
	if BubbleManager.currPoppedRow == previousRow:
		inRowCounter += 1
		if inRowCounter >= thresh:
			animationPlayer.play("Shake")
			for button in rowButtons:
				button.resetState()
				BubbleManager.subtractPop(button)
				#GameManager.currentPops -= 1
			rowButtons.clear()
			inRowCounter = 0
	else:
		previousRow = BubbleManager.currPoppedRow
		rowButtons.clear()
		inRowCounter = 1
	rowButtons.append(BubbleManager.lastPopped)
