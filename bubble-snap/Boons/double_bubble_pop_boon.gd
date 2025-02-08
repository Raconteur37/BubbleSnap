extends PanelContainer

const boonName = "Double Bubble Pop"
const description = "Every time you pop a bubble, another random bubble pops too"
const icon = "res://Sprites/Boon Textures/doubleBubbleLegendary.png"

var activateType = ["Player Pop"]
var rarity = "Legendary"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	var randBubble
	while (randBubble == null):
		randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
		if randBubble != null:
			$AnimationPlayer.play("Shake")
			randBubble.pop("Pop")
