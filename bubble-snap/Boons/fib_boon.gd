extends PanelContainer

const boonName = "Fibonacci"
const description = "When reaching a fibonacci number, pop the number of bubbles that came before it"
const icon = "res://Boon Textures/doubleBubbleLegendary.png"

var pops = 0

var activatePopList = [1,2,3,5,8,13,21,34,55]

var activateType = ["Player Pop"]
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	pops += 1
	if activatePopList.has(pops):
		var numBeforeIndex = activatePopList.find(pops)
		var numBefore
		if numBeforeIndex != 0:
			numBefore = activatePopList[(numBeforeIndex-1)]
		else:
			numBefore = 1
		if numBefore == 34:
			pops = 0
		$AnimationPlayer.play("Shake")
		for x in range(numBefore):
			var randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
			if randBubble != null:
				randBubble.pop("Pop")
