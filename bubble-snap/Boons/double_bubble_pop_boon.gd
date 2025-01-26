extends PanelContainer

const boonName = "Double Bubble Pop"
const description = "Every time you pop a bubble, pop another random bubble"
const icon = "res://Boon Textures/doubleBubbleLegendary.png"

var activateType = "Player Pop"
var rarity = "Legendary"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	var randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
	if randBubble != null:
		randBubble.pop("Pop")
		BubbleManager.addPop(randBubble,"Pop")
