extends PanelContainer

const boonName = "Extra Time"
const description = "Gives you [color=red]10[/color] extra seconds"
const icon = "res://Boon Textures/timeBoon.png"

var activateType = ["None"]
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)
	GameManager.totalTime += 10
