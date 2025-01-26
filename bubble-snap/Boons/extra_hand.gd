extends PanelContainer

const boonName = "Extra Hand"
const description = "Every [color=red]4[/color]th hand pop, hand pops another bubble"
const icon = "res://Boon Textures/Bubble_Hand.png"

var pops = 0

var activatePops = 4

var activateType = ["Player Pop"]
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	pops += 1
	if pops >= activatePops:
		pops = 0
		var randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
		if randBubble != null:
			$AnimationPlayer.play("Shake")
			randBubble.pop("Player Pop")
			BubbleManager.addPop(randBubble,"Player Pop")
