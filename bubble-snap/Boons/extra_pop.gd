extends PanelContainer

const boonName = "Extra Hand"
const description = "Every [color=green]hand pop[/color] has a [color=red]5[/color]% chance to [color=green]hand pop[/color] an extra bubble"
const icon = "res://Boon Textures/bonusPop.png"

var activateChance = 5

var activateType = "Player Pop"
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	var val = randi_range(0,100)
	if val <= activateChance:
		var randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
		if randBubble != null:
			randBubble.pop("Player Pop")
			BubbleManager.addPop(randBubble,"Player Pop")
