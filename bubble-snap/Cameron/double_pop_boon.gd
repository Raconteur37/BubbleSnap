extends Control

const boonName = "Chain Pop"

var activateChance = 10

var activateType = "Pop"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	var val = randi_range(0,100)
	if val <= activateChance:
		var randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
		if randBubble != null:
			randBubble.pop()
			BubbleManager.addPop(randBubble)
