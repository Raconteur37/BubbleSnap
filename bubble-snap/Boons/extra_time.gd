extends PanelContainer

const boonName = "Extra Time"
const description = "Gain an additional[color=red]10[/color] seconds"
const icon = "res://Sprites/Boon Textures/timeBoon.png"

var activateType = ["None"]
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)
	GameManager.totalTime += 10
