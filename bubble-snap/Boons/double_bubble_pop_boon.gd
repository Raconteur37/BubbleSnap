extends PanelContainer

const boonName = "Double Bubble Pop"
const description = "Every time you pop a bubble, pop another random bubble"
const icon = "res://Boon Textures/doubleBubble.png"

var pops = 0

var activatePops = 5

var activateType = "Player Pop"
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	pops += 1
	if pops >= activatePops:
		pops = 0
		var randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
		if randBubble != null:
			randBubble.pop("Pop")
			BubbleManager.addPop(randBubble,"Pop")
