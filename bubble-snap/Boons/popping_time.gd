extends PanelContainer

const boonName = "Popping Time"
const description = "When the amount of pops you have exceeds the time left, pop the time left amount"
const icon = "res://Boon Textures/ChainBoon.png"

var activated = false

var activateType = ["None"]
var rarity = "Rare"

var currentWave = -1

func _ready() -> void:
	BoonManager.activeBoons.append(self)

func _process(delta: float) -> void:
	if not activated and GameManager.inWave:
		if GameManager.currentPops > GameManager.mainTimer.time_left:
			currentWave = GameManager.wave
			$AnimationPlayer.play("Shake")
			activated = true
			for x in range(GameManager.mainTimer.time_left):
				var randBubble = BubbleManager.unPoppedBubbleArray.pick_random()
				if randBubble != null:
					randBubble.pop("Pop")
	if GameManager.wave != currentWave:
		activated = false
