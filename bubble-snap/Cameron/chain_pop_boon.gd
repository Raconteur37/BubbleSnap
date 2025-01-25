extends Control

const boonName = "Chain Pop"
const description = "Whenever a bubble is popped, there is a [color=red]10[/color]% it pops another random bubble"
const icon = "balls"

var activateChance = 10

var activateType = "Pop"
var rarity = "Rare"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	var val = randi_range(0,100)
	if val <= activateChance:
		var randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
		if randBubble != null:
			randBubble.pop()
			BubbleManager.addPop(randBubble)
