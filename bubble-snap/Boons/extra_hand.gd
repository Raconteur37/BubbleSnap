extends PanelContainer

const boonName = "Extra Hand"
const description = "Every manual pop has a [color=red]10%[/color] chance to pop an extra bubble"
const icon = "res://Sprites/Boon Textures/Bubble_Hand.png"

var activateChance = 11

var activateType = ["Player Pop"]
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	var val = randi_range(0,100)
	if val <= activateChance:
		var randBubble
		while (randBubble == null):
			randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
			if randBubble != null:
				$AnimationPlayer.play("Shake")
				randBubble.pop("Pop")
