extends PanelContainer

const boonName = "Bonus Pop"
const description = "Every [color=red]5[/color]th bubble pop, pops another random bubble"
const icon = "res://Sprites/Boon Textures/bonusPop.png"

var pops = 0

var activatePops = 5

var activateType = ["Player Pop"]
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	pops += 1
	print("Pops! " + str(pops))
	if pops >= activatePops:
		pops = 0
		var randBubble
		while (randBubble == null):
			randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
			if randBubble != null:
				$AnimationPlayer.play("Shake")
				randBubble.pop("Pop")
