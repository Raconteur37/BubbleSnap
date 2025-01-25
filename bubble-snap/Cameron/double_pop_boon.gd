extends Control

const boonName = "Double Pop"

var activateChance = 5

var activateType = "Pop"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	if randi_range(0,100) <= activateChance:
		for bubble in BubbleManager.bubbleArray:
			pass
