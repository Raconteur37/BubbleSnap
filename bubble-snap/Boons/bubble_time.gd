extends PanelContainer

const boonName = "Bubble Time"
const description = "Every [color=red]4[/color]th hand pop gives you [color=red].5[/color] extra seconds"
const icon = "res://Boon Textures/bonusPop.png"

var activateTime = 5
var currentPop = 0

var activateType = ["Player Pop"]
var rarity = "Common"

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func activate():
	currentPop += 1
	if currentPop >= activateTime:
		$AnimationPlayer.play("Shake")
		var time = GameManager.mainTimer.time_left + .5
		GameManager.mainTimer.stop()
		GameManager.mainTimer.wait_time = time
		GameManager.mainTimer.start()
		currentPop = 0
